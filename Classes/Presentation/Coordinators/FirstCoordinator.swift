//
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
        let viewController = ThirdModule(state: .init(title: "Third",
                                                      text: "This is 3-rd view controller"),
                                         output: self).viewController
        viewController.modalPresentationStyle = .overFullScreen
        rootViewController.present(viewController, animated: true, completion: nil)
        moduleInput.doSomeSpecificStuff()
    }
}

extension FirstCoordinator: ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ModuleInput<TitleTextState>) {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
