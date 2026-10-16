/* Copyright Airship and Contributors */

import SwiftUI

/// Explains how Scenes reach the screen and lets you hold them back.
///
/// Modal and banner Scenes need no view code: Airship presents them above the app.
/// Embedded Scenes are hosted by the app with `AirshipEmbeddedView`, see the hero
/// image in `HomeView`.
struct ScenesView: View {

    @EnvironmentObject
    private var gate: SceneDisplayGate

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("Scenes")
                .font(.title)

            VStack(alignment: .leading, spacing: 16) {
                Text("Modal and banner Scenes appear on top of this app when a campaign triggers them.")
                Text("Embedded Scenes appear in an AirshipEmbeddedView, like the hero image on Home.")
            }
            .foregroundStyle(.secondary)

            Button {
                gate.isHeld.toggle()
            } label: {
                Text(gate.isHeld ? "Release Scenes" : "Hold Scenes")
                    .frame(maxWidth: .infinity)
            }
            .buttonBorderShape(.capsule)

            Text(gate.isHeld
                 ? "Scenes are queued and will display when released."
                 : "Hold Scenes to keep them from displaying, for example during playback.")
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}
