//
//  MainModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol MainModuleInput {
}

protocol MainModuleOutput {
    func mainModuleOpenFirst(_ mainModule: MainModuleInput)
    func mainModuleOpenSecond(_ mainModule: MainModuleInput)
    func mainModuleOpenThird(_ mainModule: MainModuleInput)
}

final class MainModule: Module<MainState, MainViewModel, MainViewController> {
    typealias Dependencies = HasTestService
    typealias Presenter = DependentPresenter<MainModuleOutput, Dependencies> & MainModuleInput & MainViewOutput
    override func createInput() -> BasePresenter {
        MainPresenter(state: state, dependencies: Services)
    }
}
