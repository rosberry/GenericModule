//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class TestSectionItemsFactory: GenericSectionItemsFactory<SecondViewModelDelegate,
                                                                Int,
                                                                HasTestService,
                                                                ViewOutput> {

    override func makeSectionItems(delegate: ViewModelDelegate) -> [Int] {
        dependencies.testService.array(with: delegate.state.itemsCount)
    }
}
