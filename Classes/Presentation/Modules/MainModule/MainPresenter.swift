//
//  MainPresenter.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class MainPresenter<V: ViewInput>: GenericPresenter<MainState, MainViewModel, V>, MainModuleInput, MainViewOutput, HasOutput {

    var output: MainModuleOutput?

    func firstButtonEventTriggered() {
        output?.mainModuleOpenFirst(self)
    }

    func secondButtonEventTriggered() {
        output?.mainModuleOpenSecond(self)
    }

    func thirdButtonEventTriggered() {
        output?.mainModuleOpenThird(self)
    }
}
