//
//  NewsPageUITest.swift
//  instant_newsUITests
//
//  Created by Patrice GADEGBE on 15/11/2022.
//

import XCTest

final class NewsPageUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAppLoadWithNews() throws {
        let app = XCUIApplication()
        app.launch()
        let isElementInTable =  XCUIApplication().tables.cells.firstMatch.waitForExistence(timeout: 10)
        XCTAssert(isElementInTable == true)
    }
    
    func testCanTapOnArticle() throws {
        let app = XCUIApplication()
        app.launch()
        let isElementInTable =  XCUIApplication().tables.cells.firstMatch.waitForExistence(timeout: 10)
        XCTAssert(isElementInTable == true)
        XCUIApplication().tables.cells.firstMatch.tap()
    }

    func testLaunchPerformance() throws {
        if #available(iOS 13.0, *) {
        
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
