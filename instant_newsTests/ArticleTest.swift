//
//  ArticleTest.swift
//  instant_newsTests
//
//  Created by Patrice GADEGBE on 13/11/2022.
//

import XCTest

final class ArticleTest: XCTestCase {

    func testFormatedDate_whenLessOneMinute_getCorrectNowText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .minute, value: 1, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Maintenant")
    }

    func testFormatedDate_whenCurrentTime_getCorrectNowText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .minute, value: 0, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Maintenant")
    }

    func testFormatedDate_whenMultipleMinutes_getCorrectPluralText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .minute, value: 5, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Il y a 4 minutes")
    }

    func testFormatedDate_whenOneMinutes_getCorrectSingularText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .minute, value: 2, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Il y a 1 minute")
    }

    func testFormatedDate_whenMultipleHours_getCorrectPluralText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .hour, value: 5, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Il y a 4 heures")
    }

    func testFormatedDate_whenOneHour_getCorrectSingularText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .hour, value: 2, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Il y a 1 heure")
    }

    func testFormatedDate_whenMultipleDays_getCorrectPluralText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .day, value: 5, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Il y a 4 jours")
    }

    func testFormatedDate_whenOneDay_getCorrectSingularText() throws {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .day, value: 2, to: Date())

        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "",
                publishedAt: date)

        XCTAssert(article.formattedDate() == "Il y a 1 jour")
    }

    func testCleanedContent_whenAccolade_getTextWithoutAccolade() throws {
        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "lorem ipsum [lorem]",
                publishedAt: nil)

        XCTAssert(article.cleanedContent() == "lorem ipsum ")
    }

    func testCleanedContent_whenNoAccolade_getText() throws {
        let article = Article(
                source: nil,
                author: "",
                title: "",
                description: "",
                url: "",
                urlToImage: "",
                content: "lorem ipsum (lorem)...",
                publishedAt: nil)

        XCTAssert(article.cleanedContent() == "lorem ipsum (lorem)...")
    }
}
