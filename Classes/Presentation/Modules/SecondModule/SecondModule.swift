//
//  SecondModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol SecondModuleInput: ModuleInput<SecondState> {

}

protocol SecondModuleOutput {
}

final class SecondModule: FactoryModule<TestSectionItemsFactory, SecondViewModel, SecondViewController> {
    typealias Dependnecies = HasTestService
    typealias Presenter = FactoryPresenter<SecondModuleOutput> & SecondModuleInput & SecondViewOutput
    override func createInput() -> BasePresenter {
        SecondPresenter(state: state, dependencies: Services)
    }
}
