//
// Created by Patrice GADEGBE on 18/11/2022.
//

import UIKit

class NewsPageSearchBarDelegate: NSObject, UISearchBarDelegate {

    var debounce_search: Timer?
    private let vm: ArticlesListViewModel<ArticlesRestApi>

    init(vm: ArticlesListViewModel<ArticlesRestApi>) {
        self.vm = vm
        super.init()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        debounce_search?.invalidate()
        debounce_search = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] _ in
            vm.query = textSearched
        }
    }
}
