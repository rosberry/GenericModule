//
//  ThirdPresenter.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class ThirdPresenter<V: ViewInput>: GenericPresenter<SecondState, SecondViewModel, V>, ThirdModuleInput, ThirdViewOutput, HasOutput {

    var output: ThirdModuleOutput?

    func closeEventTriggered() {
        output?.thirdModuleWantsToClose(self)
    }

    override func viewDidLoad() {
        state.title = "Third"
        state.text = "This is third viewController"
        super.viewDidLoad()
    }
}
