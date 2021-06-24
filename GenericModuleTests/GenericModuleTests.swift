//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import XCTest
@testable import GenericModule

class GenericModuleTests: XCTestCase {

    var state: DummyState!
    var coordinator: DummyCoordinator!

    override func setUp() {
        state = DummyState(text: "test")
        coordinator = DummyCoordinator(state: state)
    }

    func testModule() {
        coordinator.start()
        guard let viewController = coordinator.viewController,
              let presenter = coordinator.presenter,
              let viewInput = presenter.viewInput as? AnyObject,
              let viewOutput = viewController.output as? AnyObject,
              let presenterOutput = presenter.output as? AnyObject,
              let moduleOutput = coordinator.module?.output as? AnyObject,
              let moduleInput = coordinator.module?.input as? AnyObject else {
            XCTAssert(false)
            return
        }
        XCTAssert(viewOutput === presenter)
        XCTAssert(presenter.view === viewController)
        XCTAssert(presenterOutput === coordinator)
        XCTAssert(viewInput === viewController)
        XCTAssert(moduleInput === presenter)
        XCTAssert(moduleOutput === coordinator)
        var expectation = makeExpectation(state, keyPath: \.didLoad)
        wait(for: [expectation], timeout: 10)
        XCTAssert(viewController.label.text == state.text)
        expectation = makeExpectation(state, keyPath: \.willAppear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.willAppear)
        expectation = makeExpectation(state, keyPath: \.didAppear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.didAppear)
        
        presenter.viewInput.performUserAction()
        XCTAssert(state.userActionTriggered)
        presenter.viewInput.performModuleAction()
        XCTAssert(state.moduleActionTriggered)
        coordinator.module?.input.handleIncomingAction()
        XCTAssert(state.incommingActionTriggered)

        coordinator.finish()
        expectation = makeExpectation(state, keyPath: \.willDisappear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.willDisappear)
        expectation = makeExpectation(state, keyPath: \.didDisappear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.didDisappear)
    }

    func testFactoryModule() {
        coordinator.startFactory()
        guard let viewController = coordinator.factoryViewController,
              let presenter = coordinator.factoryPresenter,
              let viewInput = presenter.viewInput as? AnyObject,
              let viewOutput = viewController.output as? AnyObject,
              let presenterOutput = presenter.output as? AnyObject,
              let moduleOutput = coordinator.factoryModule?.output as? AnyObject,
              let moduleInput = coordinator.factoryModule?.input as? AnyObject else {
            XCTAssert(false)
            return
        }
        XCTAssert(viewOutput === presenter)
        XCTAssert(presenter.view === viewController)
        XCTAssert(presenterOutput === coordinator)
        XCTAssert(viewInput === viewController)
        XCTAssert(moduleInput === presenter)
        XCTAssert(moduleOutput === coordinator)
        var expectation = makeExpectation(state, keyPath: \.didLoad)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.items == viewController.collectionView.visibleCells.compactMap({ cell -> String? in
            guard let cell = cell as? DummyCell else {
                return nil
            }
            return cell.label.text
        }))
        expectation = makeExpectation(state, keyPath: \.willAppear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.willAppear)
        expectation = makeExpectation(state, keyPath: \.didAppear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.didAppear)

        presenter.viewInput.performUserAction()
        XCTAssert(state.userActionTriggered)
        presenter.viewInput.performModuleAction()
        XCTAssert(state.moduleActionTriggered)
        coordinator.factoryModule?.input.handleIncomingAction()
        XCTAssert(state.incommingActionTriggered)

        coordinator.finish()
        expectation = makeExpectation(state, keyPath: \.willDisappear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.willDisappear)
        expectation = makeExpectation(state, keyPath: \.didDisappear)
        wait(for: [expectation], timeout: 10)
        XCTAssert(state.didDisappear)
    }

    func testBrokenViewOutput() {
        expectFatalError(expectedMessage: "`\(BrokenViewOutputPresenter.self)` does not conforms to `\(DummyViewController.self)` output protocol.") {
            self.coordinator.startBrokenViewOutput()
        }
    }

    func testBrokenViewInput() {
        expectFatalError(expectedMessage: "`\(BrokenViewInputController.self)` does not conforms to `\(BrokenViewInputController.self)` input.") {
            self.coordinator.startBrokenViewInput()
            guard let module = self.coordinator.brokenViewInputModule,
                  let moduleInput = module.input as? BrokenViewInputModule.BasePresenter else {
                XCTAssert(false)
                return
            }
            let _ = moduleInput.viewInput
        }
    }

    func testBrokenModuleInput() {
        expectFatalError(expectedMessage: "`\(BrokenModuleInputPresenter.self)` does not conforms to `\(DummyModuleInput.self)`.") {
            self.coordinator.startBrokenModuleInput()
            guard let module = self.coordinator.brokenModuleInputModule else {
                XCTAssert(false)
                return
            }
            let _ = module.input
        }
    }

    func testBrokenPresenter() {
        expectFatalError(expectedMessage: "`\(BrokenPresenterPresenter.self)` does not conforms to `\(BrokenPresenterModule.BasePresenter.self)`.") {
            let _ = BrokenPresenterModule(state: .init(), dependencies: [])
        }
    }

    func testDependencies() {
        let dependencies = Dependency()
        let presenter = DependencyModule(state: .init(), dependencies: dependencies).presenter
        guard let presenterDependencies = presenter.dependencies as? Dependency else {
            XCTAssert(false)
            return
        }
        XCTAssert(presenterDependencies === dependencies)
    }

    private func makeExpectation(_ state: DummyState, keyPath: KeyPath<DummyState, Bool>) -> XCTestExpectation {
        expectation(for: NSPredicate(block: { state, _ in
            guard let state = state as? DummyState else {
                return false
            }
            return state[keyPath: keyPath]
        }), evaluatedWith: state, handler: nil)
    }
}
