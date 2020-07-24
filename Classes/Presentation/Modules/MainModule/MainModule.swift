//
//  MainModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol MainModuleOutput {
    func mainModuleOpenFirst(_ moduleInput: ModuleInput<MainState>)
    func mainModuleOpenSecond(_ moduleInput: ModuleInput<MainState>)
    func mainModuleOpenThird(_ moduleInput: ModuleInput<MainState>)
}

final class MainModule: Module<MainState, MainViewModel, MainViewController> {
    typealias Dependencies = HasTestService
    typealias Presenter = ModulePresenter<MainModuleOutput, Dependencies> & MainViewOutput

    override func createInput() -> BasePresenter {
        MainPresenter(state: state, dependencies: Services)
    }
}
