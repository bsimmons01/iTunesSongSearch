//
//  ContentView.swift
//  iTunesSongSearch
//
//  Created by Brian Simmons on 7/22/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = SongListViewModel()
  @State private var searchTerm = ""

  var body: some View {
    NavigationView {
      VStack(spacing: 16) {
        HStack {
          TextField("Search term (at least 3 characters)", text: $searchTerm)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocorrectionDisabled()
            .autocapitalization(.none)
            .accessibilityIdentifier("SearchTextField")

          Button("Search") {
            Task {
              await performSearch()
            }
          }
          .disabled(searchTerm.trimmingCharacters(in: .whitespaces).count < 3)
          .accessibilityIdentifier("SearchButton")
        }
        .padding([.horizontal, .top])

        if viewModel.isLoading {
          ProgressView("Searching...")
            .padding()
        } else if let error = viewModel.errorMessage {
          Text(error)
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .padding()
        } else {
          List(viewModel.songs) { song in
            NavigationLink(destination: SongDetailView(song: song)) {
              SongRow(song: song)
            }
          }
          .listStyle(.plain)
          .background(Color(.systemBackground)) // Matches light/dark mode
          .scrollContentBackground(.hidden) // Remove gray behind the list
        }
        

        Spacer()
      }
      .navigationTitle("iTunes Song Search")
    }
  }

  private func performSearch() async {
    let trimmed = searchTerm.trimmingCharacters(in: .whitespaces)
    guard trimmed.count >= 3 else { return }
    await viewModel.fetchSongs(for: trimmed)
  }
}

#Preview {
  ContentView()
}
