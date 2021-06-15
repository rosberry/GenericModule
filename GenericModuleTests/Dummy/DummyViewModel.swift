//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class DummyViewModel: ViewModel {
    var text: String

    required init(state: DummyState) {
        self.text = state.text
    }
}
