//
//  ThirdModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ModuleInput<SecondState>)
}

final class ThirdModule: Module<SecondState, SecondViewModel, ThirdViewController> {
    typealias Dependencies = HasTestService
    typealias Presenter = ThirdModule.ModulePresenter<ThirdModuleOutput, Dependencies> & ThirdViewOutput
    override func createInput() -> BasePresenter {
        ThirdPresenter(state: state, dependencies: Services)
    }
}

