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

final class ThirdModule: GenericModule <
    SecondState,
    SecondViewModel,
    ThirdPresenter<ThirdViewController>,
    ThirdViewController> {

}

