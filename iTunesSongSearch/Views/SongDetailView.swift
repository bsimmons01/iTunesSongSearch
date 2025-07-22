//
//  SongDetailView.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//
import SwiftUI
import AVKit

struct SongDetailView: View {
  let song: Song
  @State private var audioPlayer: AVPlayer?
  @State private var isPlaying = false

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
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .shadow(radius: 7)
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

        if song.previewUrl != nil {
          Button(action: togglePlayback) {
            HStack {
              Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                .font(.largeTitle)
              Text(isPlaying ? "Pause Preview" : "Play Preview")
                .fontWeight(.medium)
            }
            .padding(.top, 8)
          }
        }
        Spacer()
      }
      .padding()
    }
    .navigationTitle("Song Details")
    .navigationBarTitleDisplayMode(.inline)
  }

  private func togglePlayback() {
    guard let previewUrl = song.previewUrl else { return }

    if audioPlayer == nil {
      audioPlayer = AVPlayer(url: previewUrl)
    }

    if isPlaying {
      audioPlayer?.pause()
    } else {
      audioPlayer?.play()
    }

    isPlaying.toggle()
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

  return SongDetailView(song: sampleSong)
}
