//
// Created by Patrice GADEGBE on 10/11/2022.
//

import Foundation

class ArticlesRestApi: NSObject, ArticlesRestApiInterface {
    required override init() {
        super.init()
    }

    func fetchArticles(query: String?, sortBy: String, completion: @escaping ([Article]) -> ()) {
        var sourcesURL = URL(string: "https://newsapi.org/v2/top-headlines?language=\(Config.language)&sortBy=\(sortBy)")!
        if (query != nil && !query!.isEmpty) {
            sourcesURL = URL(string: "https://newsapi.org/v2/everything?q=\(query!)&language=\(Config.language)&sortBy=\(sortBy)")!
        }

        var request = URLRequest(url: sourcesURL)
        request.addValue(Config.apiKey, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let result = try? decoder.decode(Result.self, from: data)
                        completion(result?.articles ?? [Article]())
                    }
                }
                .resume()
    }
}