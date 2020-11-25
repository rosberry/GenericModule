//
//  Copyright © 2020 Rosberry. All rights reserved.
//

protocol HasOutput: class {
    associatedtype Output
    var output: Output? { get set }
}

protocol HasDependencies {
    associatedtype Dependencies
    var dependencies: Dependencies { get }
}

protocol HasFactory {
    associatedtype Factory
    var factory: Factory { get }
}
