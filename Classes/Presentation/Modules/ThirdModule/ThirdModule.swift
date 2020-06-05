//
//  ThirdModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol ThirdModuleInput {

}

protocol ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ThirdModuleInput)
}

final class ThirdModule: Module<SecondState, SecondViewModel, ThirdViewController> {
    typealias Dependencies = HasTestService
    typealias Presenter = ThirdModule.DependentPresenter<ThirdModuleOutput, Dependencies> & ThirdModuleInput & ThirdViewOutput
    override func createInput() -> BasePresenter {
        ThirdPresenter(state: state, dependencies: Services)
    }
}

