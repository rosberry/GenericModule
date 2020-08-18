//
//  Copyright © 2020 Rosberry. All rights reserved.
//

final class SecondViewModel: FactoryViewModel<TestSectionItemsFactory> {

    let title: String

    required init(state: SecondState) {
        title = state.title
        super.init(state: state)
    }
}
