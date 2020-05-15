//
//  MainModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol MainModuleInput {
    var state: MainState { get set}
}

protocol MainModuleOutput {
    func mainModuleOpenFirst(_ mainModule: MainModuleInput)
    func mainModuleOpenSecond(_ mainModule: MainModuleInput)
    func mainModuleOpenThird(_ mainModule: MainModuleInput)
}

final class MainModule: GenericModule <
    MainState,
    MainViewModel,
    MainPresenter<MainViewController>,
    MainViewController > {

}
