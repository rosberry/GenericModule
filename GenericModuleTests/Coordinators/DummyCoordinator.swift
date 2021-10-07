//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit
@testable import GenericModule

final class DummyCoordinator: Coordinator<UINavigationController> {

    var window: UIWindow
    let state: DummyState
    var viewController: DummyViewController?
    var presenter: DummyPresenter?
    var module: DummyModule?
    var factoryViewController: DummyFactoryViewController?
    var factoryPresenter: DummyFactoryPresenter?
    var factoryModule: DummyFactoryModule?
    var brokenViewInputModule: BrokenViewInputModule?
    var brokenModuleInputModule: BrokenModuleInputModule?

    init(state: DummyState) {
        self.state = state
        window = UIWindow(frame: UIScreen.main.bounds)
        super.init(rootViewController: UINavigationController())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    func start() {
        let module = DummyModule(state: state, dependencies: [])
        module.output = self
        self.module = module
        self.viewController = module.viewController
        self.presenter = module.input as? DummyPresenter
        rootViewController.pushViewController(module.viewController, animated: false)
    }

    func startFactory() {
        let module = DummyFactoryModule(state: state, dependencies: [])
        module.output = self
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.factoryViewController = module.viewController
        self.factoryPresenter = module.input as? DummyFactoryPresenter
        self.factoryModule = module

        rootViewController.pushViewController(module.viewController, animated: false)
    }

    func startNonConformableViewOutput() {
        let module = NonConformableViewOutputModule(state: state, dependencies: [])
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        rootViewController.pushViewController(module.viewController, animated: false)
    }

    func startBrokenViewOutput() {
        let module = BrokenViewOutputModule(state: state, dependencies: [])
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        rootViewController.pushViewController(module.viewController, animated: false)
    }

    func startBrokenViewInput() {
        let module = BrokenViewInputModule(state: state, dependencies: [])
        self.brokenViewInputModule = module
        DispatchQueue.main.async {
            self.window.rootViewController = self.rootViewController
            self.window.makeKeyAndVisible()
            self.rootViewController.pushViewController(module.viewController, animated: false)
        }
    }

    func startBrokenModuleInput() {
        let module = BrokenModuleInputModule(state: state, dependencies: [])
        self.brokenModuleInputModule = module
        DispatchQueue.main.async {
            self.window.rootViewController = self.rootViewController
            self.window.makeKeyAndVisible()
            self.rootViewController.pushViewController(module.viewController, animated: false)
        }
    }

    func finish() {
        window.rootViewController = nil
    }
}

extension DummyCoordinator: DummyModuleOutput {

    func dummyModulePerformsAction(_ module: DummyModuleInput) {
        state.moduleActionTriggered = true
    }
}

extension DummyCoordinator: DummyFactoryModuleOutput {
    func dummyFactoryModulePerformsAction(_ module: DummyFactoryModuleInput) {
        state.moduleActionTriggered = true
    }
}
