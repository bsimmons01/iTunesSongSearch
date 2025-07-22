//
//  SongSearchService.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//

import Foundation

class SongSearchService {
  func fetchSongs(for artist: String, limit: Int = 25) async throws -> [Song] {
    let query = artist.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let urlString = "https://itunes.apple.com/search?term=\(query)&limit=\(limit)&entity=song"

    guard let url = URL(string: urlString) else {
      throw URLError(.badURL)
    }

    let (data, _) = try await URLSession.shared.data(from: url)

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601

    let response = try decoder.decode(SongSearchResponse.self, from: data)
    return response.results
  }
}
