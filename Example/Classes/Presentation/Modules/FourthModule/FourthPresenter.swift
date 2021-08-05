//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

typealias FourthViewController = TitleTextViewController<Any, TitleTextViewOutput>

final class FourthPresenter: DefaultPresenter<TitleTextState, FourthViewController, Any, Any, Any> {
}

extension FourthPresenter: TitleTextViewOutput {
    func closeEventTriggered() {
    }
}
