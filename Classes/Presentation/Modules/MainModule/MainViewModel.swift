//
//  MainViewModel.swift
//  Coordinators
//
//  Created by Nick Tyunin on 14.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class MainViewModel: ViewModel<MainState> {

    let title1: String
    let title2: String
    let title3: String
    let title: String

    required init(state: MainState) {
        title1 = state.title1
        title2 = state.title2
        title3 = state.title3
        title = state.title
        super.init(state: state)
    }
}
