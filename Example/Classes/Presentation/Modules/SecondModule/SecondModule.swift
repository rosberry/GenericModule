//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import GenericModule

final class SecondModule: FactoryModule<TestSectionItemsFactory, SecondViewModel, SecondViewController> {

    override func makeInput() -> BasePresenter {
        FactoryPresenter<Any>(state: state, dependencies: Services)
    }
}
