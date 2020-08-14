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
    func firstModuleOpenSecond(_ moduleInput: FirstModuleInput) {
        let viewController = SecondModule(state: SecondState(), output: self).viewController
        rootViewController.pushViewController(viewController, animated: true)
        moduleInput.doSomeSpecificStuff()
    }

    func firstModuleOpenThird(_ moduleInput: FirstModuleInput) {
        let viewController = ThirdModule(state: SecondState(), output: self).viewController
        viewController.modalPresentationStyle = .overFullScreen
        rootViewController.present(viewController, animated: true, completion: nil)
        moduleInput.doSomeSpecificStuff()
    }
}

extension FirstCoordinator: ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ModuleInput<SecondState>) {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
