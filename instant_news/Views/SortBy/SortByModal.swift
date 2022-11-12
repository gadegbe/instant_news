//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

class SortByModal: UIAlertController {
    override func viewDidLoad() {
        title = "Trier"

        SortBy.sorts.forEach({ sortBy in
            let element = UIAlertAction(title: sortBy.name, style: .default, handler: { (action) -> Void in
                print(sortBy.value)
            })
            addAction(element)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })

        addAction(cancelButton)
    }
}
