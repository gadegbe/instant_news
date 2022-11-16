//
//  ArticleDetailsPage.swift
//  instant_newsUITests
//
//  Created by Patrice GADEGBE on 15/11/2022.
//

import XCTest

final class ArticleDetailsPageUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testArticleDetailHaveOpenBrowserButton() throws {
        let app = XCUIApplication()
        app.launch()
        let isElementInTable =  XCUIApplication().tables.cells.firstMatch.waitForExistence(timeout: 10)
        XCTAssert(isElementInTable == true)
        XCUIApplication().tables.cells.firstMatch.tap()
        XCTAssert(app.buttons[" Lire la suite dans le navigateur"].exists)
    }
}
