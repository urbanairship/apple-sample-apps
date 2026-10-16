/* Copyright Urban Airship and Contributors */

import AirshipCore
import AirshipMessageCenter
import AirshipPreferenceCenter
import SwiftUI

struct AppView: View {
    
    @EnvironmentObject
    private var toast: Toast

    @EnvironmentObject
    private var router: AppRouter

    var body: some View {
        TabView(selection: $router.selectedTab) {
            HomeView()
                .tabItem {
                    Label(
                        "Home",
                        systemImage: "house.fill"
                    )
                }
                .onAppear {
                    Airship.analytics.trackScreen("home")
                }
                .tag(AppRouter.Tabs.home)

            ScenesView()
                .tabItem {
                    Label(
                        "Scenes",
                        systemImage: "rectangle.on.rectangle"
                    )
                }
                .onAppear {
                    Airship.analytics.trackScreen("scenes")
                }
                .tag(AppRouter.Tabs.scenes)

            MessageCenterView()
                .tabItem {
                    Label(
                        "Message Center",
                        systemImage: "tray.fill"
                    )
                }
                .onAppear {
                    Airship.analytics.trackScreen("message_center")
                }
                .tag(AppRouter.Tabs.messageCenter)

            PreferenceCenterView(
                preferenceCenterID: router.preferenceCenterID
            )
            .navigationViewStyle(.stack)
            .tabItem {
                Label(
                    "Preferences",
                    systemImage: "person.fill"
                )
            }
            .onAppear {
                Airship.analytics.trackScreen("preference_center")
            }
            .tag(AppRouter.Tabs.preferenceCenter)
        }
        .overlay {
            ToastView(toast: toast).padding()
        }
    }
}


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(AppRouter())
            .environmentObject(Toast())
            .environmentObject(SceneDisplayGate())

    }
}
