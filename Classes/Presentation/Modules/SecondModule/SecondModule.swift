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

final class SecondModule: GenericModule <
    SecondState,
    SecondViewModel,
    SecondPresenter<SecondViewController>,
    SecondViewController> {
    
}
