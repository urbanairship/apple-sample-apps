/* Copyright Airship and Contributors */

import SwiftUI

extension View {
    /// Wrapper to prevent linter warnings for the deprecated `onChange` method.
    ///
    /// Airship SDK 21.0 moved its own copy of this helper behind
    /// `@_spi(AirshipInternal)`, so apps that used it keep a local copy instead.
    ///
    /// - Parameters:
    ///   - value: The value to observe for changes.
    ///   - initial: A Boolean value that determines whether the action should be fired initially.
    ///   - action: The action to perform when the value changes.
    @ViewBuilder
    func airshipOnChangeOf<Value: Equatable>(
        _ value: Value,
        initial: Bool = false,
        _ action: @escaping (Value) -> Void
    ) -> some View {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, tvOS 17.0, *) {
            self.onChange(of: value, initial: initial, {
                action(value)
            })
        } else {
            self.onChange(of: value, perform: action)
        }
    }
}
