//
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class MainPresenter: MainModule.Presenter {

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
