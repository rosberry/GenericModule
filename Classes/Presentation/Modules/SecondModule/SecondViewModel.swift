//
//  SecondViewModel.swift
//  Coordinators
//
//  Created by Nick Tyunin on 14.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class SecondViewModel: FactoryViewModel<TestSectionItemsFactory> {

    let title: String
    let text: String

    required init(state: SecondState) {
        title = state.title
        text = state.text
        super.init(state: state)
    }
}
