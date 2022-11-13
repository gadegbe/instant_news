//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

class SortByModal: UIAlertController {
    private var vm: ArticlesListViewModel?

    init(vm: ArticlesListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.vm = vm
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        title = "Trier"

        SortBy.sorts.forEach({ sortBy in
            let element = UIAlertAction(title: sortBy.name, style: .default, handler: { [self] (action) -> Void in
                vm?.selectOrder = sortBy
            })
            addAction(element)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })

        addAction(cancelButton)
    }
}
