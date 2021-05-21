//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule
import UIKit

final class AppCoordinator: Coordinator<UINavigationController> {

    var window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        super.init(rootViewController: UINavigationController())
    }

    func start(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let module = MainModule(state: .init(), dependencies: [])
        module.output = self
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        rootViewController.pushViewController(module.viewController, animated: false)
    }
}

extension AppCoordinator: MainModuleOutput {

    func mainModuleOpenFirst(_ moduleInput: MainModuleInput) {
//        let module = FirstCoordinator(rootViewController: rootViewController).start()
//        rootViewController.pushViewController(module.viewController, animated: true)
    }

    func mainModuleOpenSecond(_ moduleInput: MainModuleInput) {
//        let viewController = SecondModule(state: SecondState(), output: self).viewController
//        rootViewController.pushViewController(viewController, animated: true)
    }

    func mainModuleOpenThird(_ moduleInput: MainModuleInput) {
//        let viewController = ThirdModule(state: .init(title: "Third",
//                                                      text: "This is 3-rd view controller"),
//                                         output: self).viewController
//        viewController.modalPresentationStyle = .overFullScreen
//        rootViewController.present(viewController, animated: true, completion: nil)
    }

    func mainModuleOpenFourth(_ moduleInput: MainModuleInput) {
//        let viewController = FourthModule(state: .init(title: "Fourth",
//                                                       text: "This is 4-th view controller"),
//                                          output: self).viewController
//        rootViewController.pushViewController(viewController, animated: true)
    }
}
//
//extension AppCoordinator: ThirdModuleOutput {
//    func thirdModuleWantsToClose(_ moduleInput: ModuleInput<TitleTextState>) {
//        rootViewController.dismiss(animated: true, completion: nil)
//    }
//}
