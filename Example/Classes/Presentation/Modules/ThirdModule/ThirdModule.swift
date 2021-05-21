//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

protocol ThirdModuleInput {
}

protocol ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ThirdModuleInput)
}

final class ThirdModule: Module<ThirdPresenter> {
}
