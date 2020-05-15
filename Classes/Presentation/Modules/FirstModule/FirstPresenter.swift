//
//  FirstPresenter.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class FirstPresenter<V: ViewInput>: GenericPresenter<FirstState, FirstViewModel, V>, FirstModuleInput, FirstViewOutput, HasOutput {

    var output: FirstModuleOutput?

    func secondButtonEventTriggered() {
        output?.firstModuleOpenSecond(self)
    }

    func thirdButtonEventTriggered() {
        output?.firstModuleOpenThird(self)
    }
}
