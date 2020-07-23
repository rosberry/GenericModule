//
//  MainModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol MainModuleInput: ModuleInput<MainState> {
}

protocol MainModuleOutput {
    func mainModuleOpenFirst(_ moduleInput: MainModuleInput)
    func mainModuleOpenSecond(_ moduleInput: MainModuleInput)
    func mainModuleOpenThird(_ moduleInput: MainModuleInput)
}

final class MainModule: Module<MainState, MainViewModel, MainViewController> {
    typealias Dependencies = HasTestService
    typealias Presenter = ModulePresenter<MainModuleOutput, Dependencies> & MainModuleInput & MainViewOutput

    override func createInput() -> BasePresenter {
        MainPresenter(state: state, dependencies: Services)
    }
}
