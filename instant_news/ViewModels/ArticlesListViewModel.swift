//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class ArticlesListViewModel<T: ArticlesRestApiInterface>: NSObject {

    private var newsApi: T!

    private(set) var articles: [Article] = [Article]() {
        didSet {
            reloadContent()
        }
    }

    var selectOrder: SortBy = SortBy.sorts.first! {
        didSet {
            resetViewModel()
        }
    }

    var query: String? {
        didSet {
            resetViewModel()
        }
    }

    private func resetViewModel() {
        articles.removeAll()
        stopFetch = false
        currentPage = 1
        fetchArticles()
    }

    var reloadContent: () -> () = {
    }

    var currentPage: Int = 1;

    var stopFetch: Bool = false;

    var isLoading: Bool = false;

    override init() {
        super.init()
        newsApi = T.init()
        fetchArticles()
    }

    func fetchArticles() {
        if (!stopFetch) {
            isLoading = true
            newsApi.fetchArticles(query: query, sortBy: selectOrder.value, page: currentPage, completion: { [self] (articles) in
                if (articles.isEmpty) {
                    stopFetch = true
                } else {
                    self.articles += articles
                    if query == nil || query!.isEmpty {
                        stopFetch = true
                    } else {
                        currentPage += 1
                    }
                }
                isLoading = false
            })
        }
    }
}