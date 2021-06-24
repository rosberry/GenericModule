//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class ThirdPresenter: Presenter<ThirdViewController, ThirdModuleInput, ThirdModuleOutput, Any> {
}

extension ThirdPresenter: ThirdModuleInput {

}

extension ThirdPresenter: ThirdViewOutput {
    func closeEventTriggered() {
        viewInput.printText()
        output?.thirdModuleWantsToClose(self)
    }
}
