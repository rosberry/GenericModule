//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

protocol FirstModuleInput {
    func doSomeSpecificStuff()
}

protocol FirstModuleOutput {
    func firstModuleOpenSecond(_ moduleInput: FirstModuleInput)
    func firstModuleOpenThird(_ moduleInput: FirstModuleInput)
}

final class FirstModule: Module<FirstPresenter> {

}
