//
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class TestSectionItemsFactory: GenericSectionItemsFactory<SecondState, Int, HasTestService, ViewOutput> {

    override func makeSectionItems(state: SecondState) -> [Int] {
        dependencies.testService.array(with: state.itemsCount)
    }
}
