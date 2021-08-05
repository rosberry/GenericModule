//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol ViewModel {
    associatedtype ViewModelDelegate
    init(delegate: ViewModelDelegate)
}
