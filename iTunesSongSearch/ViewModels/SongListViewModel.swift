//
//  SongListViewModel.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//
import Foundation

@MainActor
class SongListViewModel: ObservableObject {
  @Published var songs: [Song] = []
  @Published var isLoading = false
  @Published var errorMessage: String?

  private let service = SongSearchService()

  func fetchSongs(for artist: String) async {
    isLoading = true
    errorMessage = nil

    // Ensure this line always runs, in case of thrown error before expected
    defer { isLoading = false }

    do {
      let result = try await service.fetchSongs(for: artist)
      songs = result
    } catch {
      errorMessage = "Failed to load songs: \(error.localizedDescription)"
    }
  }
}

