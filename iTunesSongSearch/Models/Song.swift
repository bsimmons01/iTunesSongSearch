//
//  Song.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//
import SwiftUI
import Foundation

struct Song: Identifiable, Decodable {
    let id: Int
    let trackName: String?
    let artistName: String?
    let collectionName: String?
    let artworkUrl100: URL?
    let previewUrl: URL?
    let releaseDate: String?
    let primaryGenreName: String?

    // Map JSON keys to Swift property names
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case collectionName
        case artworkUrl100
        case previewUrl
        case releaseDate
        case primaryGenreName
    }
}
