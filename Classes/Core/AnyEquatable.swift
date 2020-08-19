//
// Copyright (c) 2020 Rosberry. All rights reserved.
//

import Foundation

public struct AnyEquatable: Equatable {
    private let value: Any
    private let equals: (Any) -> Bool

    public init<Value: Equatable>(_ value: Value) {
        self.value = value
        self.equals = { any in
            (any as? Value) == value
        }
    }

    public static func == (lhs: AnyEquatable, rhs: AnyEquatable) -> Bool {
        lhs.equals(rhs.value)
    }
}
