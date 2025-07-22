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
    HStack(alignment: .top, spacing: 12) {
      AsyncImage(url: song.artworkUrl100) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .frame(width: 60, height: 60)
        case .success(let image):
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60)
            .clipped()
            .cornerRadius(8)
        case .failure:
          Color.gray
            .frame(width: 60, height: 60)
            .cornerRadius(8)
        @unknown default:
          EmptyView()
        }
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(song.trackName ?? "Unknown Track")
          .font(.headline)
        Text(song.artistName ?? "Unknown Artist")
          .font(.subheadline)
          .foregroundColor(.secondary)

        if let releaseDate = song.releaseDate,
           let year = releaseDate.prefix(4) as Substring? {
          Text("Released: \(year)")
            .font(.caption)
            .foregroundColor(.gray)
        }

        if let genre = song.primaryGenreName {
          Text(genre)
            .font(.caption2)
            .foregroundColor(.blue)
        }
      }
    }
    .padding(.vertical, 6)
  }
}

#Preview {
  let sampleSong = Song(
    id: 1234567890,
    trackName: "Island in the Sun",
    artistName: "Weezer",
    collectionName: "Weezer (Green Album)",
    artworkUrl100: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/4c/f2/2f/4cf22f8f-fbfd-59f7-b4f7-1b3d5d8845a0/source/100x100bb.jpg"),
    previewUrl: nil,
    releaseDate: "2001-05-15T12:00:00Z",
    primaryGenreName: "Alternative"
  )

  return SongRow(song: sampleSong)
}
