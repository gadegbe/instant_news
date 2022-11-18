//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

class SortByModal: UIAlertController {
    var vm: ArticlesListViewModel<ArticlesRestApi>?

    override func viewDidLoad() {
        title = "Trier"

        SortBy.sorts.forEach({ sortBy in
            let element = UIAlertAction(title: sortBy.name, style: .default, handler: { [self] (action) -> Void in
                // change the order of article
                vm?.selectOrder = sortBy
            })
            addAction(element)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)

        addAction(cancelButton)
    }
}
