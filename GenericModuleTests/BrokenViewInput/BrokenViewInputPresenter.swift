//
//  Copyright © 2021 Rosberry. All rights reserved.
//

@testable import GenericModule

final class BrokenViewInputPresenter: Presenter<BrokenViewInputController, BrokenViewInputModuleInput, DummyModuleOutput, Any> {

}

extension BrokenViewInputPresenter: BrokenViewInputModuleInput {
    
}

extension BrokenViewInputPresenter: DummyViewOutput {
    func userActionTriggered() {
        
    }

    func moduleActionTriggered() {

    }
}
