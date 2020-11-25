//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

public class Coordinator<V: UIViewController> {

    public var rootViewController: V

    public init(rootViewController: V) {
        self.rootViewController = rootViewController
    }
}
