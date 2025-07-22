//
//  SongDetailView.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//


import SwiftUI

struct SongDetailView: View {
  let song: Song

  var body: some View {
    ScrollView {
      VStack(spacing: 16) {
        if let url = song.artworkUrl100 {
          AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
              ProgressView()
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
            case .failure:
              Color.gray
                .frame(height: 150)
                .cornerRadius(12)
            @unknown default:
              EmptyView()
            }
          }
          .frame(maxWidth: 200)
        }

        Text(song.trackName ?? "Unknown Title")
          .font(.title)
          .bold()
          .multilineTextAlignment(.center)

        Text("By \(song.artistName ?? "Unknown Artist")")
          .font(.headline)
          .foregroundColor(.secondary)

        if let album = song.collectionName {
          Text("Album: \(album)")
        }

        if let release = song.releaseDate {
          let year = String(release.prefix(4))
          Text("Released: \(year)")
        }

        if let genre = song.primaryGenreName {
          Text("Genre: \(genre)")
        }

        Spacer()
      }
      .padding()
    }
    .navigationTitle("Song Details")
    .navigationBarTitleDisplayMode(.inline)
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

  return SongDetailView(song: sampleSong)
}
