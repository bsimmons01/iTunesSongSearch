//
//  iTunesSongSearchTests.swift
//  iTunesSongSearchTests
//
//  Created by Brian Simmons on 7/22/25.
//

import XCTest
@testable import iTunesSongSearch

final class iTunesSongSearchTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testDecodeSongSearchResponse() throws {
    let json = """
    {
      "resultCount": 1,
      "results": [
        {
          "trackId": 123456,
          "trackName": "Test Track",
          "artistName": "Test Artist",
          "collectionName": "Test Album",
          "artworkUrl100": "https://example.com/art.jpg",
          "previewUrl": "https://example.com/audio.m4a",
          "releaseDate": "2022-01-01T00:00:00Z",
          "primaryGenreName": "Test Genre"
        }
      ]
    }
    """.data(using: .utf8)!

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601

    let response = try decoder.decode(SongSearchResponse.self, from: json)
    XCTAssertEqual(response.resultCount, 1)

    let song = response.results.first
    XCTAssertEqual(song?.trackName, "Test Track")
    XCTAssertEqual(song?.artistName, "Test Artist")
    XCTAssertEqual(song?.primaryGenreName, "Test Genre")
  }

  func testEmptySearchResponse() throws {
    let json = """
  {
    "resultCount": 0,
    "results": []
  }
  """.data(using: .utf8)!
    
    let decoder = JSONDecoder()
    let response = try decoder.decode(SongSearchResponse.self, from: json)

    XCTAssertEqual(response.resultCount, 0)
    XCTAssertTrue(response.results.isEmpty)
  }
}
