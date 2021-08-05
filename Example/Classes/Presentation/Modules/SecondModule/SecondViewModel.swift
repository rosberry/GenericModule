//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class SecondViewModel: ViewModel {

    let title: String
    let listSectionItems: [Int]

    init(delegate: FactoryViewModelDelegate<TestSectionItemsFactory>) {
        title = delegate.state.title
        listSectionItems = delegate.makeSectionItems()
    }
}
