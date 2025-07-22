//
//  SongSearchResponse.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//
import SwiftUI
import Foundation

struct SongSearchResponse: Decodable {
    let resultCount: Int
    let results: [Song]
}


