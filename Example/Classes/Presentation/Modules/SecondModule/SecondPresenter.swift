//
//  Copyright © 2021 Rosberry. All rights reserved.
//

import GenericModule

final class SecondPresenter: FactoryPresenter<SecondState,
                                              TestSectionItemsFactory,
                                              SecondViewController,
                                              Any, Any, HasTestService>,
                             SecondViewModelDelegate {
}
