//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class TitleTextViewModel: ViewModel {

    let title: String
    let text: String

    init(builder: GenericViewModelBuilder<TitleTextState>) {
        title = builder.state.title
        text = builder.state.text
    }
}
