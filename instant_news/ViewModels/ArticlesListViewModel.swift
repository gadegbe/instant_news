//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class ArticlesListViewModel: NSObject {

    private var newsApi: ArticlesRestApi!
    private(set) var articles: [Article]! {
        didSet {
            reloadContent()
        }
    }

    var reloadContent: () -> () = {
    }

    override init() {
        super.init()
        newsApi = ArticlesRestApi()
        fetchArticles()
    }

    func fetchArticles() {
        newsApi.fetchArticles { (articles) in
            self.articles = articles
        }
    }
}