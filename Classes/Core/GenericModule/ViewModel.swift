//
//  Copyright © 2020 Rosberry. All rights reserved.
//

class ViewModel<State> {
    required init(state: State) {
    }
}

class FactoryViewModel<Factory: SectionItemsFactory>: ViewModel<Factory.State> {
    var listSectionItems: [Factory.SectionItem]
    required convenience init(state: Factory.State, factory: Factory) {
        self.init(state: state)
        listSectionItems = factory.makeSectionItems(state: state)
    }

    required init(state: Factory.State) {
        listSectionItems = []
        super.init(state: state)
    }
}
