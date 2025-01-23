//
//  home_mainUITests.swift
//  home_mainUITests
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import XCTest

final class HomeMainUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testTabClick() throws {
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        let groupsButton = tabBar.buttons["Groups"]
        groupsButton.tap()
        tabBar.buttons["Photos"].tap()
        groupsButton.tap()
        tabBar.buttons["Friends"].tap()
    }
}
