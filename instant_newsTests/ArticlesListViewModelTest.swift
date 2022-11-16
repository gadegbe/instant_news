//
//  ArticleTest.swift
//  instant_newsTests
//
//  Created by Patrice GADEGBE on 13/11/2022.
//

import XCTest

final class ArticlesListViewModelTest: XCTestCase {

    func testIdleViewModel() throws {
        let vm = ArticlesListViewModel<ArticlesRestApiMock>()
        XCTAssert(vm.articles == [
            Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
            Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
        ])

    }

    func testQueryViewModel() throws {
        let vm = ArticlesListViewModel<ArticlesRestApiMock>()
        vm.query = "Bitcoin"
        XCTAssert(vm.articles == [
            Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
            Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
            Article(source: nil, author: "", title: "", description: "", url: "", urlToImage: "", content: "", publishedAt: nil),
        ])

    }
}
