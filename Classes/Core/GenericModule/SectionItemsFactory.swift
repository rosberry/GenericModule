//
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol SectionItemsFactory {
    associatedtype SectionItem
    associatedtype State
    associatedtype Dependencies
    associatedtype Output

    var output: Output? { get set }
    var dependencies: Dependencies { get set }
    init(dependencies: Dependencies)
    func makeSectionItems(state: State) -> [SectionItem]
}

class GenericSectionItemsFactory<State, SectionItem, Dependencies, Output>: SectionItemsFactory {
    var dependencies: Dependencies
    var output: Output?

    required init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func makeSectionItems(state: State) -> [SectionItem] {
        []
    }
}
