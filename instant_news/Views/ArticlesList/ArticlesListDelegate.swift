//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

class ArticlesListDelegate: NSObject, UITableViewDelegate {

    var navigationController: UINavigationController?
    private let vm: ArticlesListViewModel


    init(navigationController: UINavigationController?, vm: ArticlesListViewModel) {
        self.navigationController = navigationController
        self.vm = vm
        super.init()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ArticleDetailPageController(article: vm.articles[indexPath.row]), animated: true)
    }
}
