//
//  SecondModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol SecondModuleInput {

}

protocol SecondModuleOutput {
}

final class SecondModule: Module<SecondState, SecondViewModel, SecondViewController> {
    typealias Dependnecies = HasTestService
    typealias Presenter = FactoryPresenter<SecondModuleOutput, Dependnecies, TestSectionItemsFactory> & SecondModuleInput & SecondViewOutput
    override func createInput() -> BasePresenter {
        SecondPresenter(state: state,
                        factory: TestSectionItemsFactory(),
                        dependencies: Services)
    }
}
