//
//  FirstCoordinator.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

final class FirstCoordinator: Coordinator<UINavigationController> {

    func start() -> FirstModule {
        FirstModule(state: FirstState(), output: self)
    }
}

extension FirstCoordinator: FirstModuleOutput {
    func firstModuleOpenSecond(_ firstModule: FirstModuleInput) {
        let viewController = SecondModule(state: SecondState(), output: self).viewController
        rootViewController.pushViewController(viewController, animated: true)
    }

    func firstModuleOpenThird(_ firstModule: FirstModuleInput) {
        let viewController = ThirdModule(state: SecondState(), output: self).viewController
        viewController.modalPresentationStyle = .overFullScreen
        rootViewController.present(viewController, animated: true, completion: nil)
    }
}

extension FirstCoordinator: SecondModuleOutput {

}

extension FirstCoordinator: ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ThirdModuleInput) {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
