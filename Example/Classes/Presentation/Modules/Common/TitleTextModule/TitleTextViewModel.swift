//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class TitleTextViewModel: ViewModel {

    let title: String
    let text: String

    required init(state: TitleTextState) {
        title = state.title
        text = state.text
    }
}
