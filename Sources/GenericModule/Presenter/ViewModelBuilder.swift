//
//  Copyright © 2021 Rosberry. All rights reserved.
//

open class GenericViewModelDelegate<State> {
    public let state: State

    public init(state: State) {
        self.state = state
    }
}

open class FactoryViewModelDelegate<Factory: SectionItemsFactory> {
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
