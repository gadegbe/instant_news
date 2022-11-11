//
// Created by Patrice GADEGBE on 11/11/2022.
//

import Foundation

class Result: Codable {
    let status: String!
    let totalResults: Double!
    let articles: [Article]
}
