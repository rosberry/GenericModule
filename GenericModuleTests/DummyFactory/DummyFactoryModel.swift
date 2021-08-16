//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

protocol DummyFactoryViewModelDelegate: AnyObject {
    var state: DummyState { get }
    func makeSectionItems() -> [String]
}

final class DummyFactoryModel: ViewModel {
    let listSectionItems: [String]
    init(delegate: DummyFactoryViewModelDelegate) {
        self.listSectionItems = delegate.makeSectionItems()
    }
}
