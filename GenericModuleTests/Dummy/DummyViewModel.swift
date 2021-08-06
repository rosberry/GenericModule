//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class DummyViewModel: ViewModel {
    var text: String

    required init(delegate: GenericViewModelDelegate<DummyState>) {
        self.text = delegate.state.text
    }
}
