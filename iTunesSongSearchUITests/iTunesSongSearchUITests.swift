//
//  iTunesSongSearchUITests.swift
//  iTunesSongSearchUITests
//
//  Created by Brian Simmons on 7/22/25.
//

import XCTest

final class iTunesSongSearchUITests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  @MainActor
  func testSearchFlow() throws {
    let app = XCUIApplication()
    app.launch()

    let searchField = app.textFields["SearchTextField"]
    XCTAssertTrue(searchField.exists)
    searchField.tap()
    searchField.typeText("weezer")

    let searchButton = app.buttons["SearchButton"]
    XCTAssertTrue(searchButton.exists)
    searchButton.tap()
    
    // Wait for a known song result
    let resultCell = app.staticTexts["Island in the Sun"]
    let exists = resultCell.waitForExistence(timeout: 5)
    XCTAssertTrue(exists)
  }
}
