//
//  TestSectionItemsFactory.swift
//  Coordinators
//
//  Created by Nick Tyunin on 05.06.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//


final class TestSectionItemsFactory: SectionItemsFactory {

    var dependencies: SecondModule.Dependnecies

    init(dependencies: SecondModule.Dependnecies) {
        self.dependencies = dependencies
    }

    func createSectionItems(state: SecondState) -> [Int] {
        Array(0..<dependencies.testService.testNumber())
    }
}
