//
// Created by Patrice GADEGBE on 13/11/2022.
//

import Foundation

class ArticlesRestApiMock: NSObject, ArticlesRestApiInterface {
    required override init() {
        super.init()
    }

    func fetchArticles(query: String?, sortBy: String, completion: @escaping ([Article]) -> ()) {
        if (query == nil || query!.isEmpty) {
            completion([
                Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
                Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
            ])
        } else if (query == "Bitcoin") {
            completion([
                Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
                Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
                Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
            ])
        }
    }
}
