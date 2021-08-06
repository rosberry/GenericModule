//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

protocol FactoryDelegate {
    var state: SecondState { get }
    func makeSectionItems() -> [Int]
}

final class TestSectionItemsFactory: GenericSectionItemsFactory<FactoryDelegate,
                                                                Int,
                                                                HasTestService,
                                                                ViewOutput> {

    override func makeSectionItems(delegate: ViewModelDelegate) -> [Int] {
        dependencies.testService.array(with: delegate.state.itemsCount)
    }
}
