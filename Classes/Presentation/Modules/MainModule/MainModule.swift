//
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol MainModuleOutput {
    func mainModuleOpenFirst(_ moduleInput: ModuleInput<MainState>)
    func mainModuleOpenSecond(_ moduleInput: ModuleInput<MainState>)
    func mainModuleOpenThird(_ moduleInput: ModuleInput<MainState>)
    func mainModuleOpenFourth(_ moduleInput: ModuleInput<MainState>)
}

final class MainModule: Module<MainState, MainViewModel, MainViewController> {
    typealias Dependencies = HasTestService
    typealias Presenter = ModulePresenter<MainModuleOutput, Dependencies> & MainViewOutput

    override func makeInput() -> BasePresenter {
        MainPresenter(state: state, dependencies: Services)
    }
}
