//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol ViewModel {
    associatedtype ViewModelBuilder: GenericModule.ViewModelBuilder
    init(builder: ViewModelBuilder)
}
