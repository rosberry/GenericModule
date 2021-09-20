//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class DummyListItemsFactory: GenericSectionItemsFactory<DummyFactoryViewModelDelegate, String, Any, DummyFactoryViewOutput> {

    override func makeSectionItems(delegate: ViewModelDelegate) -> [String] {
        super.makeSectionItems(delegate: delegate) + delegate.state.items
    }
}
