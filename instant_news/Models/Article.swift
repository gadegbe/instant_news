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
        let date1 = publishedAt!
        let date2 = Date()

        let component = calendar.dateComponents([.minute, .hour, .day], from: date1, to: date2)
        let day = abs(component.day ?? 0)
        let hour = abs(component.hour ?? 0)
        let minute = abs(component.minute ?? 0)

        if (component.minute != nil && minute == 0 && component.minute != nil && minute == 0 && component.day != nil && day == 0) {
            return "Maintenant"
        } else if day > 0 && day < 7 {
            return "Il y a \(day) jour\(day > 1 ? "s" : "")"
        } else if hour > 0 && hour < 24 {
            return "Il y a \(hour) heure\(hour > 1 ? "s" : "")"
        } else if minute > 0 && minute < 60 {
            return "Il y a \(minute) minute\(minute > 1 ? "s" : "")"
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
    }
}

