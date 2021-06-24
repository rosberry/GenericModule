//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class MainPresenter: Presenter<MainViewController, MainModuleInput, MainModuleOutput, Any> {

}

extension MainPresenter: MainModuleInput {

}

extension MainPresenter: MainViewOutput {

    func firstButtonEventTriggered() {
        output?.mainModuleOpenFirst(self)
    }

    func secondButtonEventTriggered() {
        output?.mainModuleOpenSecond(self)
    }

    func thirdButtonEventTriggered() {
        output?.mainModuleOpenThird(self)
    }

    func fourthButtonEventTriggered() {
        output?.mainModuleOpenFourth(self)
    }
}
