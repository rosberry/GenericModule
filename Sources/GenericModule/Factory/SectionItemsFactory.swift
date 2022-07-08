//
//  Copyright © 2020 Rosberry. All rights reserved.
//

public protocol SectionItemsFactory: AnyObject {
    associatedtype SectionItem
    associatedtype ViewModelDelegate
    associatedtype Dependencies
    associatedtype Output

    var output: Output? { get set }
    var dependencies: Dependencies { get set }

    init(dependencies: Dependencies)
    func makeSectionItems(delegate: ViewModelDelegate) -> [SectionItem]
}

open class GenericSectionItemsFactory<ViewModelDelegate, SectionItem, Dependencies, Output>: SectionItemsFactory {

    private weak var _output: AnyObject?

    open var dependencies: Dependencies
    open var output: Output? {
        get {
            _output as? Output
        }
        set {
            _output = newValue as? AnyObject
        }
    }

    required public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    open func makeSectionItems(delegate: ViewModelDelegate) -> [SectionItem] {
        []
    }
}
