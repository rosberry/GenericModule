//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class TitleTextViewModel: ViewModel {

    let title: String
    let text: String

    init(delegate: GenericViewModelDelegate<TitleTextState>) {
        title = delegate.state.title
        text = delegate.state.text
    }
}
