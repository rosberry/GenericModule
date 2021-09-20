# Generic Module

## Build your architecture like a song.

Tired to write massive view controllers according apple MVC? There is an exit!
Look at our non-reactive MVP solution. All you need is declare instances protocols and their implementations
and compose them altogether!

## Requirements

- swift 5.3
- iOS 10 or bigger

## Usage
- First, declare `State` and `ViewModel` implementations:
```swift
// MyState.swift

final class MyState {
    var someVariable = "some value"
}

// MyViewModel.swift

final class MyViewModel: ViewModel {
    
    var someVariable: Any

    required init(delegate: MyViewModelDelegate) {
        // initialize all required variables here 
    }
}
```
Please note, that required `ViewModel` initializer takes associated type `ViewModelDelegate` that can be used to initialize stored properties. You can pass here any protocol or use `GenericViewModelDelegate<State>`. Last one provides the access to module state.

Variables of state and view model cold be not casted one to other, so you can make some specific stuff in view model initializer.

- Then, declare a protocols to send messages between architecture layers:
```swift
// MyModule.swift

protocol MyModuleInput: ModuleInput<FirstState> {
    func doSomeSpecificStuff()
}

protocol MyModuleOutput {
    func myModuleSendOutputMessage(_ moduleInput: MyModuleInput)
}

// MyViewController.swift

protocol MyViewOutput: ViewOutput {
    func myButtonEventTriggered()
}
```

- Declare `ViewController` that implements `ViewInput` protocol:
```swift
// MyViewController.swift
final class MyViewController: UIViewController {
    typealias Output = MyViewOutput & ViewOutput
    typealias ViewInput = MyViewInput
    var output: Output
    var viewModel: MyViewModel
}

extension MyViewController: View, MyViewInput {
    
    func update(with viewModel: MyViewModel, force: Bool, animated: Bool) {
        // TODO: Update view if needed
    }
}
```
You do not need assign `output` and `viewModel`  to some value - `GenericModule` will make it automatically.

- Declare `Presenter` and implement or required protocols:
```swift
// MyPresenter.swift
final class MyPresenter: Presenter<MyState, MyViewController, MyModuleInput, MyModuleOutput, MyModuleDependencies> {
}

extension MyPresenter: MyModuleInput {
    func doSomeSpecificStuff() {
        // Handle module input event
    }
}

extension MainPresenter: MainViewOutput {
    func myButtonEventTriggered() {
        // Handle view event
    }
}

extension MainPresenter: MyModuleDependencies {
    // Implement `ViewModelDelegate` here 
}
```
Note that you should not implement `ViewModelDelegate` if `ViewModel` takes `GenericViewModelDelegate`. Also, if you don't want to implement `ViewModelDelegate` in `Presenter` then you can override `makeViewModelDelegate()` method and return custom intance:

```swift
// MyPresenter.swift
...
override func makeViewModelDelegate() -> MyViewModelDelegate {
    // Return here custom view model delegate instance 
}
...
```

- Declare `Module` that compose altogether:
```swift
// MyModule.swift
class MyModule: Module<MyPresenter> {
}
```
- All you need to do now - instantiate module bundle:
```swift
// MyCoordinator.swift

func startMyModule {
    let module = MyModule(state: .init(), dependencies: MyModuleDependencies, output: self)
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
