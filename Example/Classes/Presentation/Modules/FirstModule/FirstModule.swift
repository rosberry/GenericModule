//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

protocol FirstModuleInput: ModuleInput<FirstState> {
    func doSomeSpecificStuff()
}

protocol FirstModuleOutput {
    func firstModuleOpenSecond(_ moduleInput: FirstModuleInput)
    func firstModuleOpenThird(_ moduleInput: FirstModuleInput)
}

final class FirstModule: Module<FirstState, FirstViewModel, FirstViewController> {

    typealias Dependencies = HasTestService
    typealias Presenter = FirstModule.ModulePresenter<FirstModuleOutput, HasTestService> &
                          FirstModuleInput &
                          FirstViewOutput

    override func makeInput() -> BasePresenter {
        FirstPresenter(state: state, dependencies: Services)
    }
}
