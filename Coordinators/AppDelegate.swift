//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

typealias LaunchOptions = [UIApplication.LaunchOptionsKey: Any]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var appCoordinator: AppCoordinator = .init()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {
        appCoordinator.start(launchOptions: launchOptions)
        return true
    }
}
