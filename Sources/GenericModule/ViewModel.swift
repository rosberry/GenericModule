//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public class ViewModel<State> {
    required public init(state: State) {
    }
}

public class FactoryViewModel<Factory: SectionItemsFactory>: ViewModel<Factory.State> {
    public var listSectionItems: [Factory.SectionItem]
    required convenience public init(state: Factory.State, factory: Factory) {
        self.init(state: state)
        listSectionItems = factory.makeSectionItems(state: state)
    }

    required public init(state: Factory.State) {
        listSectionItems = []
        super.init(state: state)
    }
}
