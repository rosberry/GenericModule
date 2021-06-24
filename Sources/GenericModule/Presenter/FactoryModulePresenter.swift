//
//  Copyright © 2021 Rosberry. All rights reserved.
//

public protocol FactoryModulePresenter: ModulePresenter {
    associatedtype Factory: SectionItemsFactory
    var factory: Factory { get set }
}
