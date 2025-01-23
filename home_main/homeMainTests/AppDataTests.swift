//
//  AppDataTests.swift
//  homeMainTests
//
//  Created by Ильяс Альфатович on 23.01.2025.
//

import XCTest
@testable import homeMain

final class AppDataTests: XCTestCase {

//    override func setUpWithError() throws {
//        try super.setUpWithError()
//    }
//
//    override func tearDownWithError() throws {
//        try super.tearDownWithError()
//    }

    func test1CommonRunning() throws {
        XCTAssertEqual(AppData.currentTheme.title, "sepia")
        XCTAssertEqual(AppData.currentTheme.background.cgColor, SepiaTheme().background.cgColor)
    }
    func test2ChangingTheme() throws {
        AppData.setCurrentTheme(color: .light)
        print(AppData.currentTheme.title)
        XCTAssertEqual(AppData.currentTheme.title, "light")
        XCTAssertEqual(AppData.currentTheme.background.cgColor, LightTheme().background.cgColor)
    }
}
