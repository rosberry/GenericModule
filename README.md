# Generic Module

## Build your architecture like a song.

## Requirements

- swift 5.3
- iOS 10 or bigger

## Usage
- First, declare `State` and `ViewModel` implementations:
```swift
// MyState.swift

class MyState {
    var someVariable = "some value"
}

// MyViewModel.swift

class MyViewModel: ViewModel<MyState> {
    
    var someVariable: Any

    required init(state: MyState) {
        self.someVariable = state.someVariable
    }
}
```
Variables of state and view model cold be not casted one to other, so you can make some specific stuff in view model initializer.

- Then, declare a protocols to send messages between architecture layers:
```swift
// MyModule.swift

protocol MyModuleInput: ModuleInput<FirstState> {
    func doSomeSpecificStuff()
}

protocol MyModuleOutput {
    func myModuleSendOutputMessage(_ moduleInput: FirstModuleInput)
}

// MyViewController.swift

protocol MyViewOutput: ViewOutput {
    func firstButtonEventTriggered()
}
```

- Declare `ViewController` that implements `ViewInput` protocol:
```swift
// MyViewController.swift
class MyViewController: UIViewController {

    var output: MyViewOutput?
    var viewModel: MyViewModel

    ...

}

extension MyViewController: ViewInput {
    
    func update(with viewModel: MainViewModel, force: Bool, animated: Bool) {
        // TODO: Update view if needed
    }
}
```
You do not need assign `output` and `viewModel`  to some value - `GenericModule` will make it automatically.

- Declare `Module` that compose altogether:
```swift
// MyModule.swift
class MyModule: Module<MyState, MyViewModel, MyViewController> {
    typealias Dependencies = MyModuleDepencencies
    typealias Presenter = ModulePresenter<MyModuleOutput, Dependencies> & MyViewOutput

    override func makeInput() -> BasePresenter {
        // TODO: Return concrete presenter
    }
}
```
Note that related types `Dependecies` and `Presenter` declared right inside module.

- Declare `Presenter` and return it's instance from module `makeInput()` method:
```swift
// MyPresenter.swift
final class MyPresenter: MyModule.Presenter {

    // TODO: Implement `MyModuleInput` and `MyViewOutput` methods here
}

// MyModule.swift
override func makeInput() -> BasePresenter {
    MyPresenter(state: state, dependencies: MyModuleDepencencies())
}
```
- All you need to do now - instantiate module bundle:
```swift
// MyCoordinator.swift

func startMyModule {
    let module = MainModule(state: .init(), output: self)
    let viewController = module.viewController
    //TODO: Make something with `viewController`
}
```
- All done: `ViewController` will hold `Presenter` via `ViewOutput` protocol using `output` property. 
`Presenter` can send messages to `ViewController` via `ViewInput` protocol using weak `view` property.
Also, `Presenter` can send message to some `ModuleOutput` protocol using `output` property. 

## Installation
### Carthage (preferred)
```
github rosberry/GenericModule
```

## Swift Package Manager
```
dependencies: [
    ...
    .package(url: "https://github.com/rosberry/GenericModule", from: "1.0.0"),
    ...
]
```

## About

<img src="https://github.com/rosberry/Foundation/blob/master/Assets/full_logo.png?raw=true" height="100" />

This project is owned and maintained by [Rosberry](http://rosberry.com). We build mobile apps for users worldwide 🌏.

Check out our [open source projects](https://github.com/rosberry), read [our blog](https://medium.com/@Rosberry) or give us a high-five on 🐦 [@rosberryapps](http://twitter.com/RosberryApps).

## License

This project is available under the MIT license. See the LICENSE file for more info.
