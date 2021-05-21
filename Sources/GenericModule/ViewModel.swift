//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol ViewModel {
    associatedtype State
    init(state: State)
}

//open class FactoryViewModel<Factory: SectionItemsFactory>: ViewModel<Factory.State> {
//    open var listSectionItems: [Factory.SectionItem]
//    required convenience public init(state: Factory.State, factory: Factory) {
//        self.init(state: state)
//        listSectionItems = factory.makeSectionItems(state: state)
//    }
//
//    required public init(state: Factory.State) {
//        listSectionItems = []
//        super.init(state: state)
//    }
//}
