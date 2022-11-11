//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit


struct Article: Hashable, Codable {
    let source: Source!
    let author, title, description, url, urlToImage, content: String?
    let publishedAt: Date?


    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
        hasher.combine(title)
    }

    static func ==(lhs: Article, rhs: Article) -> Bool {
        lhs.title == rhs.title && lhs.url == rhs.url
    }

    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: publishedAt!)
    }
}

