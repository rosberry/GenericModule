//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

class Coordinator<V: UIViewController> {

    var rootViewController: V

    init(rootViewController: V) {
        self.rootViewController = rootViewController
    }
}
