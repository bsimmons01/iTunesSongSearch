# iTunesSongSearch

A lightweight SwiftUI app that searches the iTunes API for songs by artist name and displays the results in a clean, tappable list. Users can view track details and listen to audio previews.

## 🚀 Features

- 🔍 Search by artist name (minimum 3 characters)
- 📜 Displays track name, artist, genre, release year (album on detail view)
- 🎧 Audio preview playback using `AVPlayer`
- 🖼 Album artwork (via `AsyncImage`)
- 🧭 Tappable rows navigate to a full song detail view
- 🧪 Unit tested JSON decoding logic
- ✅ Clean Swift Concurrency (async/await) and MVVM architecture

## 🛠 Tech Stack

- Swift 5.9+
- SwiftUI
- AVKit (`AVPlayer`)
- iTunes Search API
- XCTest for basic decoding validation

## 📱 Screenshots

| Search View | Song Detail |
|-------------|-------------|
| <img width="1206" height="2622" alt="SongList" src="https://github.com/user-attachments/assets/7686bb8c-818f-43ff-91ba-d769bc2cddd5" />
 | <img width="1206" height="2622" alt="SongDetail" src="https://github.com/user-attachments/assets/82b6d588-f54e-4a18-9fff-10c3afc5ed5d" />
 |

## 📦 API Used

- `https://itunes.apple.com/search?term=ARTIST&entity=song&limit=25`

Example:  
`https://itunes.apple.com/search?term=zeppelin&entity=song&limit=25`

## 🔧 Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/bsimmons01/iTunesSongSearch.git
