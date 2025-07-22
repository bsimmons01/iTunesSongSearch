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
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .shadow(radius: 7)

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
    artworkUrl100: URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/d0/16/da/d016da24-577e-b584-3a5a-116efb5ca362/16UMGIM52971.rgb.jpg/100x100bb.jpg"),
    previewUrl: URL(string:"https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/11/23/6f/11236f0d-9b5a-b780-5ebb-56c1dc512e3a/mzaf_11156035496161349512.plus.aac.p.m4a"),
    releaseDate: "2001-05-15T12:00:00Z",
    primaryGenreName: "Alternative"
  )

  return SongRow(song: sampleSong)
}
