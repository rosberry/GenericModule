//
//  Copyright © 2020 Rosberry. All rights reserved.
//

var Services = ServiceFactory()

final class ServiceFactory: HasTestService {
    var testService: TestService = TestServiceImpl()
}
