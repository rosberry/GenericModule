//
//  Copyright © 2020 Rosberry. All rights reserved.
//

open class ModuleInput<State> {
    open var state: State
    public init(state: State) {
        self.state = state
    }
}
