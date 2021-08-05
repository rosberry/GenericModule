//
//  Copyright © 2021 Rosberry. All rights reserved.
//

public protocol ViewModelBuilder {
    associatedtype State
    var state: State { get }
}

open class GenericViewModelBuilder<State>: ViewModelBuilder {
    public let state: State

    public init(state: State) {
        self.state = state
    }
}

open class FactoryViewModelBuilder<Factory: SectionItemsFactory>: ViewModelBuilder {
    public typealias State = Factory.State
    public let state: State
    public let factory: Factory

    public func makeSectionItems() -> [Factory.SectionItem] {
        factory.makeSectionItems(state: state)
    }

    init(state: State, factory: Factory) {
        self.state = state
        self.factory = factory
    }
}
