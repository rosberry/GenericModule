//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class FirstPresenter: DefaultPresenter<FirstState, FirstViewController, FirstModuleInput, FirstModuleOutput, HasTestService> {

}

extension FirstPresenter: FirstViewOutput {
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

extension FirstPresenter: FirstModuleInput {

}
