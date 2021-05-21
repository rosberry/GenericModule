//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

final class FirstCoordinator: Coordinator<UINavigationController> {

    func start() -> FirstModule {
        let module = FirstModule(state: .init(), dependencies: Services)
        module.output = self
        return module
    }
}

extension FirstCoordinator: FirstModuleOutput {
    func firstModuleOpenSecond(_ moduleInput: FirstModuleInput) {
        let viewController = SecondModule(state: SecondState(), dependencies: Services).viewController
        rootViewController.pushViewController(viewController, animated: true)
        moduleInput.doSomeSpecificStuff()
    }

    func firstModuleOpenThird(_ moduleInput: FirstModuleInput) {
        let state = TitleTextState(title: "Third",
                                   text: "This is 3-rd view controller")
        let module = ThirdModule(state: state, dependencies: Services)
        module.output = self
        let viewController = module.viewController
        viewController.modalPresentationStyle = .overFullScreen
        rootViewController.present(viewController, animated: true, completion: nil)
        moduleInput.doSomeSpecificStuff()
    }
}

extension FirstCoordinator: ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ThirdModuleInput) {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
