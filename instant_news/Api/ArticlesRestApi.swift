//
// Created by Patrice GADEGBE on 10/11/2022.
//

import Foundation

class ArticlesRestApi: NSObject {

    private let sourcesURL = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=689640af8e3444f2888cc2bcb715948c")!

    func fetchArticles(completion: @escaping ([Article]) -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let result = try! decoder.decode(Result.self, from: data)
                        completion(result.articles)
                    }
                }
                .resume()
    }
}