//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

class ArticlesListDelegate: NSObject, UITableViewDelegate {

    var navigationController: UINavigationController?
    private let vm: ArticlesListViewModel<ArticlesRestApi>

    init(navigationController: UINavigationController?, vm: ArticlesListViewModel<ArticlesRestApi>) {
        self.navigationController = navigationController
        self.vm = vm
        super.init()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to article detail page
        navigationController?.pushViewController(ArticleDetailPageController(article: vm.articles[indexPath.row]), animated: true)
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // make the infinite load when reached the and of the list
        let isReachingEnd = scrollView.contentOffset.y >= 0
                && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
        if isReachingEnd && !vm.isLoading {
            vm.fetchArticles()
        }
    }
}
