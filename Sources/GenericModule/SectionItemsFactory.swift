//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol SectionItemsFactory {
    associatedtype SectionItem
    associatedtype State
    associatedtype Dependencies
    associatedtype Output

    var output: Output? { get set }
    var dependencies: Dependencies { get set }

    init(dependencies: Dependencies)
    func makeSectionItems(state: State) -> [SectionItem]
}

open class GenericSectionItemsFactory<State, SectionItem, Dependencies, Output>: SectionItemsFactory {
    open var dependencies: Dependencies
    open var output: Output?

    required public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    open func makeSectionItems(state: State) -> [SectionItem] {
        []
    }
}
