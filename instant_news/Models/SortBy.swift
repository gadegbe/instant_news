//
// Created by Patrice GADEGBE on 10/11/2022.
//

import Foundation

struct SortBy {
    let value, name: String

    static let sorts = [
        SortBy(value: "relevancy", name: "Pertinance"),
        SortBy(value: "popularity", name: "Popularité"),
        SortBy(value: "publishedAt", name: "Date de publication"),
    ]
}
