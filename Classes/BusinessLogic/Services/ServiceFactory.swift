//
//  ServiceFactory.swift
//  Coordinators
//
//  Created by Nick Tyunin on 05.06.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

var Services = ServiceFactory()

final class ServiceFactory: HasTestService {
    var testService: TestService = TestServiceImpl()
}
