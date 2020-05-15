//
//  Module.swift
//  Coordinators
//
//  Created by Nick Tyunin on 14.05.2020.
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

class GenericViewModel<State> {

    required init(state: State) {

    }
}

protocol HasOutput: class {
    associatedtype Output
    var output: Output? { get set }
}

protocol ViewInput: HasOutput {

    associatedtype VM

    var viewModel: VM { get set}

    init(viewModel: VM)
    func update(with viewModel: VM, force: Bool, animated: Bool)
}

class GenericPresenter<S, VM: GenericViewModel<S>, V: ViewInput> {
    weak var view: V?
    var state: S

    required init(state: S) {
        self.state = state
    }

    func viewDidLoad() {
        update(force: true, animated: false)
    }


    func update(force: Bool = false, animated: Bool) {
        let viewModel = VM.init(state: state)
        view?.update(with: viewModel as! V.VM, force: force, animated: animated)
    }
}


class GenericModule<S, VM: GenericViewModel<S>, P: GenericPresenter<S, VM, V> & HasOutput, V: ViewInput> {

    var viewController: V
    var input: P
    var output: P.Output? {
        get {
            input.output
        }
        set {
            input.output = newValue
        }
    }

    init(state: S, output: P.Output) {
        input = P.init(state: state)
        let viewModel = VM.init(state: state)
        viewController = V.init(viewModel: viewModel as! V.VM)
        viewController.output = input as? V.Output
        input.view = viewController
        self.output = output
    }
}
