//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

protocol MainModuleOutput {
    func mainModuleOpenFirst(_ moduleInput: MainModuleInput)
    func mainModuleOpenSecond(_ moduleInput: MainModuleInput)
    func mainModuleOpenThird(_ moduleInput: MainModuleInput)
    func mainModuleOpenFourth(_ moduleInput: MainModuleInput)
}

protocol MainModuleInput {

}

final class MainModule: GenericModule.Module<MainPresenter> {
}
