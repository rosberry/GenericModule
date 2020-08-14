//
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class FirstPresenter: FirstModule.Presenter {

    func secondButtonEventTriggered() {
        output?.firstModuleOpenSecond(self)
    }

    func thirdButtonEventTriggered() {
        output?.firstModuleOpenThird(self)
    }

    func doSomeSpecificStuff() {
        print("\(self): Yes, I do")
    }
}
