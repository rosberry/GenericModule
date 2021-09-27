//
//  UpdateTests.swift
//  GenericModuleTests
//
//  Created by Nick Tyunin on 27.09.2021.
//

import XCTest
@testable import GenericModule

final class UpdateTests: XCTestCase {

    final class ViewModel {
        let first: String
        let second: String
        let third: String
        let fourth: String

        init(first: String = "first", second: String = "second", third: String = "third", fourth: String = "fourth") {
            self.first = first
            self.second = second
            self.third = third
            self.fourth = fourth
        }
    }

    // MARK: - One key path

    func testKeyPath() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first) { value in
            XCTAssertEqual(value, "new first")
        }
    }

    func testSkipKeyPath() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first) { value in
            XCTAssert(false, "Update should not be perforformed with force == false")
        }
    }

    func testForceKeyPath() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: true)
        update(\.first) { value in
            XCTAssertEqual(value, "first")
        }
    }

    func testKeyPathWithTwoUpdated() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first", second: "new second")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first) { value in
            XCTAssertEqual(value, "new first")
        }
    }

    // MARK: - Two keypaths

    func testTwoKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first", second: "new second")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second) {
            XCTAssertEqual(newViewModel.first, "new first")
            XCTAssertEqual(newViewModel.second, "new second")
        }
    }

    func testSkipTwoPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second) {
            XCTAssert(false, "Update should not be perforformed with force == false")
        }
    }

    func testForceTwoKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: true)
        update(\.first, \.second) {
            XCTAssertEqual(newViewModel.first, "first")
            XCTAssertEqual(newViewModel.second, "second")
        }
    }

    func testTwoKeyPathsWithOneUdated() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second) {
            XCTAssertEqual(newViewModel.first, "new first")
            XCTAssertEqual(newViewModel.second, "second")
        }
    }

    // MARK: - Three keypaths

    func testThreeKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first", second: "new second", third: "new third")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second, \.third) {
            XCTAssertEqual(newViewModel.first, "new first")
            XCTAssertEqual(newViewModel.second, "new second")
            XCTAssertEqual(newViewModel.third, "new third")
        }
    }

    func testSkipThreeKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second, \.third) {
            XCTAssert(false, "Update should not be perforformed with force == false")
        }
    }

    func testForceThreeKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: true)
        update(\.first, \.second, \.third) {
            XCTAssertEqual(newViewModel.first, "first")
            XCTAssertEqual(newViewModel.second, "second")
            XCTAssertEqual(newViewModel.third, "third")
        }
    }

    func testThreeKeyPathsWithOneUpdated() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second, \.third) {
            XCTAssertEqual(newViewModel.first, "new first")
            XCTAssertEqual(newViewModel.second, "second")
            XCTAssertEqual(newViewModel.third, "third")
        }
    }

    // MARK: - Four keypaths

    func testFourKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first", second: "new second", third: "new third", fourth: "new fourth")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second, \.third, \.fourth) {
            XCTAssertEqual(newViewModel.first, "new first")
            XCTAssertEqual(newViewModel.second, "new second")
            XCTAssertEqual(newViewModel.third, "new third")
            XCTAssertEqual(newViewModel.fourth, "new fourth")
        }
    }

    func testSkipFourKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second, \.third, \.fourth) {
            XCTAssert(false, "Update should not be perforformed with force == false")
        }
    }

    func testForceFourKeyPaths() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel()
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: true)
        update(\.first, \.second, \.third, \.fourth) {
            XCTAssertEqual(newViewModel.first, "first")
            XCTAssertEqual(newViewModel.second, "second")
            XCTAssertEqual(newViewModel.third, "third")
            XCTAssertEqual(newViewModel.fourth, "fourth")
        }
    }

    func testFourKeyPathsWithOneUpdated() {
        let oldViewModel = ViewModel()
        let newViewModel = ViewModel(first: "new first")
        let update = Update(newModel: newViewModel, oldModel: oldViewModel, force: false)
        update(\.first, \.second, \.third) {
            XCTAssertEqual(newViewModel.first, "new first")
            XCTAssertEqual(newViewModel.second, "second")
            XCTAssertEqual(newViewModel.third, "third")
            XCTAssertEqual(newViewModel.fourth, "fourth")
        }
    }
}
