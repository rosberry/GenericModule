//
//  Copyright © 2020 Rosberry. All rights reserved.
//

// swiftlint:disable:next identifier_name
var Services = ServiceFactory()

final class ServiceFactory: HasTestService {
    var testService: TestService = TestServiceImpl()
}
