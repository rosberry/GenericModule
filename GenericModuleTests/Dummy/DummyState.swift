//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import UIKit

class DummyState {

    let text: String
    let items: [String]
    var didLoad: Bool = false
    var willAppear: Bool = false
    var didAppear: Bool = false
    var willDisappear: Bool = false
    var didDisappear: Bool = false
    var userActionTriggered: Bool = false
    var moduleActionTriggered: Bool = false
    var incommingActionTriggered: Bool = false

    init(text: String = "", items: [String] = []) {
        self.text = text
        self.items = items
    }
}
