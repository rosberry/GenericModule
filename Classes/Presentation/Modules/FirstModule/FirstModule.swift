//
//  FirstModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol FirstModuleInput: ModuleInput<FirstState> {
}

protocol FirstModuleOutput {
    func firstModuleOpenSecond(_ moduleInput: FirstModuleInput)
    func firstModuleOpenThird(_ moduleInput: FirstModuleInput)
}

final class FirstModule: Module<FirstState, FirstViewModel, FirstViewController> {
    typealias Dependencies = HasTestService
    typealias Presenter = FirstModule.ModulePresenter<FirstModuleOutput, HasTestService> & FirstModuleInput & FirstViewOutput
    override func createInput() -> BasePresenter {
        FirstPresenter(state: state, dependencies: Services)
    }
}
