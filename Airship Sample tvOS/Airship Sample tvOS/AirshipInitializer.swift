/* Copyright Airship and Contributors */

import AirshipCore
import Foundation

/// Example Airship SDK initialization handler.
///
/// This is a sample implementation showing how to configure and initialize
/// the Airship SDK with basic settings for development and production builds.
///
/// - Note: This is an example - customize for your app's needs.
struct AirshipInitializer {

    // Replace with your app's config
    private static let defaultAppKey: String = "VWDwdOFjRTKLRxCeXTVP6g"
    private static let defaultAppSecret: String = "5Ifi5rYgTm2QHey9JkP0WA"

    private init() {}
    
    /// Initializes Airship with example configuration.
    ///
    /// - Throws: An error if Airship initialization fails
    @MainActor
    static func initialize() throws {
        var config = AirshipConfig()
        config.productionLogLevel = .verbose
        config.developmentLogLevel = .verbose

        config.defaultAppKey = Self.defaultAppKey
        config.defaultAppSecret = Self.defaultAppSecret

        #if DEBUG
        config.inProduction = false
        config.isAirshipDebugEnabled = true
        #else
        config.inProduction = true
        #endif

        try Airship.takeOff(config)
    }
}
