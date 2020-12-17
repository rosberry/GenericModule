//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class ThirdPresenter: ThirdModule.Presenter {

    func closeEventTriggered() {
        output?.thirdModuleWantsToClose(self)
    }
}
