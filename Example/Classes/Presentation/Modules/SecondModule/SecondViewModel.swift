//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class SecondViewModel: ViewModel {

    let title: String
    let listSectionItems: [Int]

    required init(delegate: FactoryDelegate) {
        title = delegate.state.title
        listSectionItems = delegate.makeSectionItems()
    }
}
