//
// Created by Patrice GADEGBE on 13/11/2022.
//

import Foundation

protocol ArticlesRestApiInterface {
    init()
    func fetchArticles(query: String?, sortBy: String, completion: @escaping ([Article]) -> ())
}
