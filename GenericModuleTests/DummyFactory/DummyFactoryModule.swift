//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

protocol DummyFactoryModuleInput {
    func handleIncomingAction()
}

protocol DummyFactoryModuleOutput {
    func dummyFactoryModulePerformsAction(_ module: DummyFactoryModuleInput)
}

final class DummyFactoryModule: Module<DummyFactoryPresenter> {

}
