//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import Foundation

public class Update<Model> {
    private let newModel: Model
    private let oldModel: Model
    private let force: Bool

    public init(newModel: Model, oldModel: Model, force: Bool) {
        self.newModel = newModel
        self.oldModel = oldModel
        self.force = force
    }

    public func callAsFunction<A: Equatable, B: Equatable>(_ first: KeyPath<Model, A>,
                                                    _ second: KeyPath<Model, B>,
                                                    configurationBlock: () -> Void) {
        guard !force else {
            return configurationBlock()
        }
        let needUpdate = newModel[keyPath: first] != oldModel[keyPath: first] ||
                         newModel[keyPath: second] != oldModel[keyPath: second]
        if needUpdate {
            configurationBlock()
        }
    }

    public func callAsFunction<A: Equatable, B: Equatable, C: Equatable>(_ first: KeyPath<Model, A>,
                                                                  _ second: KeyPath<Model, B>,
                                                                  _ third: KeyPath<Model, C>,
                                                                  _ configurationBlock: () -> Void) {
        guard !force else {
            return configurationBlock()
        }
        let needUpdate = newModel[keyPath: first] != oldModel[keyPath: first] ||
                         newModel[keyPath: second] != oldModel[keyPath: second] ||
                         newModel[keyPath: third] != oldModel[keyPath: third]
        if needUpdate {
            configurationBlock()
        }
    }

    // swiftlint:disable:next function_parameter_count
    public func callAsFunction<A: Equatable, B: Equatable, C: Equatable, D: Equatable>(_ first: KeyPath<Model, A>,
                                                                                _ second: KeyPath<Model, B>,
                                                                                _ third: KeyPath<Model, C>,
                                                                                _ fourth: KeyPath<Model, D>,
                                                                                configurationBlock: () -> Void) {
        guard !force else {
            return configurationBlock()
        }
        let needUpdate = newModel[keyPath: first] != oldModel[keyPath: first] ||
                         newModel[keyPath: second] != oldModel[keyPath: second] ||
                         newModel[keyPath: third] != oldModel[keyPath: third] ||
                         newModel[keyPath: fourth] != oldModel[keyPath: fourth]
        if needUpdate {
            configurationBlock()
        }
    }

    public func callAsFunction<Value: Equatable>(_ keyPath: KeyPath<Model, Value>, configurationBlock: (Value) -> Void) {
        let newValue = newModel[keyPath: keyPath]
        if force {
            configurationBlock(newValue)
        }
        else if oldModel[keyPath: keyPath] != newValue {
            configurationBlock(newValue)
        }
    }
}
