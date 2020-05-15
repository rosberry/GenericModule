//
//  FirstModule.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol FirstModuleInput {
}

protocol FirstModuleOutput {
    func firstModuleOpenSecond(_ firstModule: FirstModuleInput)
    func firstModuleOpenThird(_ firstModule: FirstModuleInput)
}

final class FirstModule: GenericModule <
    FirstState,
    FirstViewModel,
    FirstPresenter<FirstViewController>,
    FirstViewController> {

}
