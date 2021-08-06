//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol FactoryViewModelDelegate {
    associatedtype State
    associatedtype SectionItem
    var state: State { get }
    func makeSectionItems() -> [SectionItem]
}

public protocol SectionItemsFactory: AnyObject {
    associatedtype SectionItem
    associatedtype ViewModelDelegate
    associatedtype Dependencies
    associatedtype Output

    var output: Output? { get set }
    var dependencies: Dependencies { get set }

    init(dependencies: Dependencies)
    func makeSectionItems(delegate: ViewModelDelegate) -> [SectionItem]
}

open class GenericSectionItemsFactory<ViewModelDelegate, SectionItem, Dependencies, Output>: SectionItemsFactory {
    open var dependencies: Dependencies
    open var output: Output?

    required public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    open func makeSectionItems(delegate: ViewModelDelegate) -> [SectionItem] {
        []
    }
}
