//
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ModuleInput<TitleTextState>)
}

final class ThirdModule: Module<TitleTextState, TitleTextViewModel, ThirdViewController> {

    typealias Dependencies = HasTestService
    typealias Presenter = ThirdModule.ModulePresenter<ThirdModuleOutput, Dependencies> &
                          ThirdViewOutput

    override func makeInput() -> BasePresenter {
        ThirdPresenter(state: state, dependencies: Services)
    }
}
