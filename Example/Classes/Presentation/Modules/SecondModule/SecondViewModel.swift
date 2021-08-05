//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class SecondViewModel: ViewModel {

    let title: String
    let listSectionItems: [Int]

    init(builder: FactoryViewModelBuilder<TestSectionItemsFactory>) {
        title = builder.state.title
        listSectionItems = builder.makeSectionItems()
    }
}
