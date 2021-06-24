//
//  Copyright © 2021 Rosberry. All rights reserved.
//

#if DEBUG
import Foundation

// overrides Swift global `fatalError`
public func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    FatalErrorUtil.fatalErrorClosure(message(), file, line)
    unreachable()
}

/// This is a `noreturn` function that pauses forever
public func unreachable() -> Never {
    repeat {
        RunLoop.current.run()
    } while (true)
}

/// Utility functions that can replace and restore the `fatalError` global function.
struct FatalErrorUtil {

    // Called by the custom implementation of `fatalError`.
    static var fatalErrorClosure: (String, StaticString, UInt) -> Void = defaultFatalErrorClosure

    // backup of the original Swift `fatalError`
    private static let defaultFatalErrorClosure: (String, StaticString, UInt) -> Void = { message, file, line in
        Swift.fatalError(message, file: file, line: line)
    }

    /// Replace the `fatalError` global function with something else.
    static func replaceFatalError(closure: @escaping (String, StaticString, UInt) -> Void) {
        fatalErrorClosure = closure
    }

    /// Restore the `fatalError` global function back to the original Swift implementation
    static func restoreFatalError() {
        fatalErrorClosure = defaultFatalErrorClosure
    }
}
#endif
