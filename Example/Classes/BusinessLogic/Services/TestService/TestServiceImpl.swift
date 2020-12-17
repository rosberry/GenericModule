//
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class TestServiceImpl: TestService {
    func array(with count: Int) -> [Int] {
        Array(0..<count)
    }
}
