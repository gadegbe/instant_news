//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

class ArticlesListDataSource: NSObject, UITableViewDataSource {
    private let vm: ArticlesListViewModel<ArticlesRestApi>

    init(_ vm: ArticlesListViewModel<ArticlesRestApi>) {
        self.vm = vm
        super.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.articles?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTile", for: indexPath) as? ArticleTile else {
            fatalError("ArticleCard is not defined!")
        }

        let article = vm.articles[indexPath.row]
        cell.configure(article)

        return cell
    }
}
