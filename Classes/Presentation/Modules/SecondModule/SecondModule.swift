//
//  SecondModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class SecondModule: FactoryModule<TestSectionItemsFactory, SecondViewModel, SecondViewController> {

    override func createInput() -> BasePresenter {
        FactoryPresenter<Any>(state: state, dependencies: Services)
    }
}
