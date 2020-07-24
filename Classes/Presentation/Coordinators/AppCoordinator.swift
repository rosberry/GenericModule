//
//  AppCoordinator.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator<UINavigationController> {

    var window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        super.init(rootViewController: UINavigationController())
    }

    func start(launchOptions: LaunchOptions?) {
        let module = MainModule(state: MainState(), output: self)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        rootViewController.pushViewController(module.viewController, animated: false)
    }
}

extension AppCoordinator: MainModuleOutput {

    func mainModuleOpenFirst(_ moduleInput: ModuleInput<MainState>) {
        let module = FirstCoordinator(rootViewController: rootViewController).start()
        rootViewController.pushViewController(module.viewController, animated: true)
    }

    func mainModuleOpenSecond(_ moduleInput: ModuleInput<MainState>) {
        let viewController = SecondModule(state: SecondState(), output: self).viewController
        rootViewController.pushViewController(viewController, animated: true)
    }

    func mainModuleOpenThird(_ moduleInput: ModuleInput<MainState>) {
        let viewController = ThirdModule(state: SecondState(), output: self).viewController
        viewController.modalPresentationStyle = .overFullScreen
        rootViewController.present(viewController, animated: true, completion: nil)
    }
}

extension AppCoordinator: ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ModuleInput<SecondState>) {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
