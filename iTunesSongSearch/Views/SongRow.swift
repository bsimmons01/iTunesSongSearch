//
//  SongRow.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//
import SwiftUI

struct SongRow: View {
  let song: Song

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(song.trackName ?? "Unknown Track")
        .font(.headline)
      Text(song.artistName ?? "Unknown Artist")
        .font(.subheadline)
        .foregroundColor(.secondary)
    }
    .padding(.vertical, 4)
  }
}
