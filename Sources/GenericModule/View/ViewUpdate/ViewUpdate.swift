//
// Copyright (c) 2020 Rosberry. All rights reserved.
//

import Foundation

public protocol ViewUpdate {

    var needsUpdate: Bool { get set }

    func update<ViewModel, Value: Equatable>(new newViewModel: ViewModel,
                                             old oldViewModel: ViewModel,
                                             keyPath: KeyPath<ViewModel, Value>,
                                             configurationHandler: (Value) -> Void)
}

public extension ViewUpdate {

    func update<ViewModel, Value: Equatable>(new newViewModel: ViewModel,
                                             old oldViewModel: ViewModel,
                                             keyPath: KeyPath<ViewModel, Value>,
                                             configurationHandler: (Value) -> Void) {
        let newValue = newViewModel[keyPath: keyPath]
        if needsUpdate || newValue != oldViewModel[keyPath: keyPath] {
            configurationHandler(newValue)
        }
    }
}

// swiftlint:disable function_parameter_count
public protocol ForceViewUpdate {

    func update<ViewModel, Value: Equatable>(new newViewModel: ViewModel,
                                             old oldViewModel: ViewModel,
                                             keyPath: KeyPath<ViewModel, Value>,
                                             force: Bool,
                                             configurationHandler: (Value) -> Void)
}

public extension ForceViewUpdate {

    func update<ViewModel, Value: Equatable>(new newViewModel: ViewModel,
                                             old oldViewModel: ViewModel,
                                             keyPath: KeyPath<ViewModel, Value>,
                                             force: Bool,
                                             configurationHandler: (Value) -> Void) {
        let newValue = newViewModel[keyPath: keyPath]
        if force || newValue != oldViewModel[keyPath: keyPath] {
            configurationHandler(newValue)
        }
    }

    func update<ViewModel>(new newViewModel: ViewModel,
                           old oldViewModel: ViewModel,
                           values: [(AnyEquatable, AnyEquatable)],
                           force: Bool,
                           configurationHandler: (Bool) -> Void) {
        configurationHandler(force || isChanged(values: values))
    }

    func update<ViewModel>(new newViewModel: ViewModel,
                           old oldViewModel: ViewModel,
                           values: [(AnyEquatable, AnyEquatable)],
                           force: Bool,
                           configurationHandler: () -> Void) {
        guard force || isChanged(values: values) else {
            return
        }
        configurationHandler()
    }

    func makeAnyEquatables<ViewModel, Value: Equatable>(new newViewModel: ViewModel,
                                                        old oldViewModel: ViewModel,
                                                        keyPath: KeyPath<ViewModel, Value>) -> (AnyEquatable, AnyEquatable) {
        (.init(newViewModel[keyPath: keyPath]), .init(oldViewModel[keyPath: keyPath]))
    }

    private func isChanged(values: [(AnyEquatable, AnyEquatable)]) -> Bool {
        values.contains { equatable, equatable2 in
            equatable != equatable2
        }
    }
}
// swiftlint:enable function_parameter_count

// MARK: - Danger Zone

// swiftlint:disable function_parameter_count line_length large_tuple
public extension ForceViewUpdate {
    func update<ViewModel, A: Equatable, B: Equatable>(new newViewModel: ViewModel,
                                                       old oldViewModel: ViewModel,
                                                       keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>),
                                                       force: Bool,
                                                       configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1]) else {
            return
        }
        configurationHandler()
    }

    func update<ViewModel, A: Equatable, B: Equatable, C: Equatable>(new newViewModel: ViewModel,
                                                                     old oldViewModel: ViewModel,
                                                                     keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>, KeyPath<ViewModel, C>),
                                                                     force: Bool,
                                                                     configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1] ||
               newViewModel[keyPath: keyPaths.2] != oldViewModel[keyPath: keyPaths.2]) else {
            return
        }
        configurationHandler()
    }

    func update<ViewModel, A: Equatable, B: Equatable, C: Equatable, D: Equatable>(
            new newViewModel: ViewModel,
            old oldViewModel: ViewModel,
            keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>, KeyPath<ViewModel, C>, KeyPath<ViewModel, D>),
            force: Bool,
            configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1] ||
               newViewModel[keyPath: keyPaths.2] != oldViewModel[keyPath: keyPaths.2] ||
               newViewModel[keyPath: keyPaths.3] != oldViewModel[keyPath: keyPaths.3]) else {
            return
        }
        configurationHandler()
    }

    func update<ViewModel, A: Equatable, B: Equatable, C: Equatable, D: Equatable, E: Equatable>(
            new newViewModel: ViewModel,
            old oldViewModel: ViewModel,
            keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>, KeyPath<ViewModel, C>, KeyPath<ViewModel, D>, KeyPath<ViewModel, E>),
            force: Bool,
            configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1] ||
               newViewModel[keyPath: keyPaths.2] != oldViewModel[keyPath: keyPaths.2] ||
               newViewModel[keyPath: keyPaths.3] != oldViewModel[keyPath: keyPaths.3] ||
               newViewModel[keyPath: keyPaths.4] != oldViewModel[keyPath: keyPaths.4]) else {
            return
        }
        configurationHandler()
    }

    func update<ViewModel, A: Equatable, B: Equatable, C: Equatable, D: Equatable, E: Equatable, F: Equatable>(
            new newViewModel: ViewModel,
            old oldViewModel: ViewModel,
            keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>, KeyPath<ViewModel, C>, KeyPath<ViewModel, D>, KeyPath<ViewModel, E>, KeyPath<ViewModel, F>),
            force: Bool,
            configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1] ||
               newViewModel[keyPath: keyPaths.2] != oldViewModel[keyPath: keyPaths.2] ||
               newViewModel[keyPath: keyPaths.3] != oldViewModel[keyPath: keyPaths.3] ||
               newViewModel[keyPath: keyPaths.4] != oldViewModel[keyPath: keyPaths.4] ||
               newViewModel[keyPath: keyPaths.5] != oldViewModel[keyPath: keyPaths.5]) else {
            return
        }
        configurationHandler()
    }

    func update<ViewModel, A: Equatable, B: Equatable, C: Equatable, D: Equatable, E: Equatable, F: Equatable, G: Equatable>(
            new newViewModel: ViewModel,
            old oldViewModel: ViewModel,
            keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>, KeyPath<ViewModel, C>, KeyPath<ViewModel, D>, KeyPath<ViewModel, E>, KeyPath<ViewModel, F>, KeyPath<ViewModel, G>),
            force: Bool,
            configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1] ||
               newViewModel[keyPath: keyPaths.2] != oldViewModel[keyPath: keyPaths.2] ||
               newViewModel[keyPath: keyPaths.3] != oldViewModel[keyPath: keyPaths.3] ||
               newViewModel[keyPath: keyPaths.4] != oldViewModel[keyPath: keyPaths.4] ||
               newViewModel[keyPath: keyPaths.5] != oldViewModel[keyPath: keyPaths.5] ||
               newViewModel[keyPath: keyPaths.6] != oldViewModel[keyPath: keyPaths.6]) else {
            return
        }
        configurationHandler()
    }

    func update<ViewModel, A: Equatable, B: Equatable, C: Equatable, D: Equatable, E: Equatable, F: Equatable, G: Equatable, H: Equatable>(
            new newViewModel: ViewModel,
            old oldViewModel: ViewModel,
            keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>, KeyPath<ViewModel, C>, KeyPath<ViewModel, D>, KeyPath<ViewModel, E>, KeyPath<ViewModel, F>, KeyPath<ViewModel, G>, KeyPath<ViewModel, H>),
            force: Bool,
            configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1] ||
               newViewModel[keyPath: keyPaths.2] != oldViewModel[keyPath: keyPaths.2] ||
               newViewModel[keyPath: keyPaths.3] != oldViewModel[keyPath: keyPaths.3] ||
               newViewModel[keyPath: keyPaths.4] != oldViewModel[keyPath: keyPaths.4] ||
               newViewModel[keyPath: keyPaths.5] != oldViewModel[keyPath: keyPaths.5] ||
               newViewModel[keyPath: keyPaths.6] != oldViewModel[keyPath: keyPaths.6] ||
               newViewModel[keyPath: keyPaths.7] != oldViewModel[keyPath: keyPaths.7]) else {
            return
        }
        configurationHandler()
    }

    func update<ViewModel, A: Equatable, B: Equatable, C: Equatable, D: Equatable, E: Equatable, F: Equatable, G: Equatable, H: Equatable, I: Equatable>(
            new newViewModel: ViewModel,
            old oldViewModel: ViewModel,
            keyPaths: (KeyPath<ViewModel, A>, KeyPath<ViewModel, B>, KeyPath<ViewModel, C>, KeyPath<ViewModel, D>, KeyPath<ViewModel, E>, KeyPath<ViewModel, F>, KeyPath<ViewModel, G>, KeyPath<ViewModel, H>, KeyPath<ViewModel, I>),
            force: Bool,
            configurationHandler: () -> Void) {
        guard force ||
              (newViewModel[keyPath: keyPaths.0] != oldViewModel[keyPath: keyPaths.0] ||
               newViewModel[keyPath: keyPaths.1] != oldViewModel[keyPath: keyPaths.1] ||
               newViewModel[keyPath: keyPaths.2] != oldViewModel[keyPath: keyPaths.2] ||
               newViewModel[keyPath: keyPaths.3] != oldViewModel[keyPath: keyPaths.3] ||
               newViewModel[keyPath: keyPaths.4] != oldViewModel[keyPath: keyPaths.4] ||
               newViewModel[keyPath: keyPaths.5] != oldViewModel[keyPath: keyPaths.5] ||
               newViewModel[keyPath: keyPaths.6] != oldViewModel[keyPath: keyPaths.6] ||
               newViewModel[keyPath: keyPaths.7] != oldViewModel[keyPath: keyPaths.7] ||
               newViewModel[keyPath: keyPaths.8] != oldViewModel[keyPath: keyPaths.8]) else {
            return
        }
        configurationHandler()
    }
}

// swiftlint:enable function_parameter_count line_length tuple_length
