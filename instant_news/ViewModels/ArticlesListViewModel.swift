//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class ArticlesListViewModel<T: ArticlesRestApiInterface>: NSObject {

    private var newsApi: T!

    private(set) var articles: [Article]! {
        didSet {
            reloadContent()
        }
    }

    var selectOrder: SortBy = SortBy.sorts.first! {
        didSet {
            fetchArticles()
        }
    }

    var query: String? {
        didSet {
            fetchArticles()
        }
    }

    var reloadContent: () -> () = {
    }

    override init() {
        super.init()
        newsApi = T.init()
        fetchArticles()
    }

    func fetchArticles() {
        newsApi.fetchArticles(query: query, sortBy: selectOrder.value, completion: { (articles) in
            self.articles = articles
        })
    }
}