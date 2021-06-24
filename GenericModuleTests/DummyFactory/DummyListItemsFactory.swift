//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class DummyListItemsFactory: GenericSectionItemsFactory<DummyState, String, Any, DummyFactoryViewOutput> {

    override func makeSectionItems(state: DummyState) -> [String] {
        super.makeSectionItems(state: state) + state.items
    }
}
