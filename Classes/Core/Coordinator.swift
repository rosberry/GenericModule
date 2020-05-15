//
//  Coordinator.swift
//  Coordinators
//
//  Created by Nick Tyunin on 13.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

class Coordinator<V: UIViewController> {

    var rootViewController: V

    init(rootViewController: V) {
        self.rootViewController = rootViewController
    }
}
