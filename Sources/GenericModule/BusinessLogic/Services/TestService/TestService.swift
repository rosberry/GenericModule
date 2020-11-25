//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

protocol HasTestService {
    var testService: TestService { get }
}

protocol TestService {
    func array(with count: Int) -> [Int]
}
