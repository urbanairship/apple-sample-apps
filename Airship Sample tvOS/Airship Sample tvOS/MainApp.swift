/* Copyright Airship and Contributors */

import SwiftUI
import AirshipCore

@main
struct MainApp: App {
    
    let appRouter: AppRouter = AppRouter()
    let toast: Toast = Toast()
    var takeOffError: (any Error)?

    @Environment(\.scenePhase) private var scenePhase

    init() {
        do {
            // Initialize Airship
            try AirshipInitializer.initialize()

            // Setup optional features
            PushNotificationHandler.setup()
            DeepLinkHandler.setup(router: appRouter) { [weak toast] error in
                toast?.message = .init(text: "Invalid deepLink \(error)", duration: 2.0)
            }
        } catch {
            takeOffError = error
            print("Failed to takeOff \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            if Airship.isFlying {
                AppView()
                    .environmentObject(appRouter)
                    .environmentObject(toast)
                    .airshipOnChangeOf(scenePhase) { phase in
                        if phase == .active {
                            print("App became active!")

                            // Clear the badge on active
                            Task {
                                try await Airship.push.resetBadge()
                            }
                        }
                    }
            } else {
                ErrorFallbackView(error: takeOffError)
            }
        }
    }
}
