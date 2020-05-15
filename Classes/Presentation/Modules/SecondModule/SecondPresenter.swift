//
//  SecondPresenter.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class SecondPresenter<V: ViewInput>: GenericPresenter<SecondState, SecondViewModel, V>, SecondModuleInput, SecondViewOutput, HasOutput {
    var output: SecondModuleOutput?
}
