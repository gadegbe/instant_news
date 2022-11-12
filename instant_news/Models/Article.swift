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

        let calendar = NSCalendar.current

// Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: publishedAt!)
        let date2 = calendar.startOfDay(for: Date())

        let components = calendar.dateComponents([.minute, .hour, .day], from: date1, to: date2)
        if components.minute != nil && components.minute! > 0 && components.minute! < 60 {
            return "Il y a \(components.minute!) minutes"
        } else if components.hour != nil && components.hour! > 0 && components.hour! < 24 {
            return "Il y a \(components.hour!) heures"
        } else if components.day != nil && components.day! > 0 && components.day! < 7 {
            return "Il y a \(components.day!) jours"
        }
        return dateFormatter.string(from: publishedAt!)
    }

    func cleanedContent() -> String? {
        let string = content ?? ""
        if let leftIdx = string.firstIndex(of: "["),
           let rightIdx = string.firstIndex(of: "]") {
            let trimmedString = String(string.prefix(upTo: leftIdx) + string.suffix(from: string.index(after: rightIdx)))
            return trimmedString
        }
        return content
//        let trimmedString = string.replacingOccurrences(of: "\\s?\\[[\\w\\s]*\\]", with: "", options: .regularExpression)
//        return trimmedString
    }
}

