/* Copyright Airship and Contributors */

import AirshipAutomation
import AirshipCore
import Combine
import Foundation

/// Lets the app hold Scenes (modals and banners) until it is ready to show them.
///
/// Airship presents a Scene on its own as soon as a campaign triggers it. An app that
/// should not be interrupted, for example while playing video, can answer "not ready"
/// through `onIsReadyToDisplay` and ask Airship to re-check when that changes.
///
/// - Note: This is an example - customize for your app's needs.
@MainActor
final class SceneDisplayGate: ObservableObject {

    /// While `true` Scenes stay queued instead of displaying.
    @Published
    var isHeld: Bool = false {
        didSet {
            if oldValue && !isHeld {
                Airship.inAppAutomation.inAppMessaging.notifyDisplayConditionsChanged()
            }
        }
    }

    /// Registers the gate with Airship. Call after `takeOff`.
    func install() {
        Airship.inAppAutomation.inAppMessaging.onIsReadyToDisplay = { [weak self] _, _ in
            self?.isHeld != true
        }
    }
}
