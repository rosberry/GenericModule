//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

protocol SecondViewModelDelegate: AnyObject {
    var state: SecondState { get }
    func makeSectionItems() -> [Int]
}

final class SecondViewModel: ViewModel {

    let title: String
    let listSectionItems: [Int]

    required init(delegate: SecondViewModelDelegate) {
        title = delegate.state.title
        listSectionItems = delegate.makeSectionItems()
    }
}
