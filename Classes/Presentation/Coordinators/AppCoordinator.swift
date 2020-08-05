//
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
        let module = MainModule(state: .init(), output: self)
        
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
        let viewController = ThirdModule(state: .init(title: "Third",
                                                      text: "This is 3-rd view controller"),
                                         output: self).viewController
        viewController.modalPresentationStyle = .overFullScreen
        rootViewController.present(viewController, animated: true, completion: nil)
    }

    func mainModuleOpenFourth(_ moduleInput: ModuleInput<MainState>) {
        let viewController = FourthModule(state: .init(title: "Fourth",
                                                       text: "This is 4-th view controller"),
                                          output: self).viewController
        rootViewController.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator: ThirdModuleOutput {
    func thirdModuleWantsToClose(_ moduleInput: ModuleInput<TitleTextState>) {
        rootViewController.dismiss(animated: true, completion: nil)
    }
}
