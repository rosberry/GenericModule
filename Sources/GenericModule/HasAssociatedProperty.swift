//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol HasOutput: class {
    associatedtype Output
    var output: Output? { get set }
}

public protocol HasDependencies {
    associatedtype Dependencies
    var dependencies: Dependencies { get }
}

public protocol HasFactory {
    associatedtype Factory
    var factory: Factory { get }
}
