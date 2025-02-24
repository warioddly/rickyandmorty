//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct EpisodesView: View {
    
    @StateObject private var viewModel = EpisodesViewModel()
       
    var body: some View {
        NavigationStack {
            List(viewModel.episodes) { episode in
                NavigationLink(
                    destination: EpisodeDetailView(episode: episode)
                ) {
                    VStack (alignment: .leading) {
                        Text(episode.name)
                            .font(.headline)
                        Text(episode.episode)
                            .font(.subheadline)
                        Text(episode.air_date)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 5)
                .onAppear {
                        if episode == viewModel.episodes.last {
                            Task {
                                await viewModel.loadMoreEpisodes()
                            }
                        }
                }
            }
            .navigationTitle("Episodes")
            .onAppear {
                Task {
                    await viewModel.fetchEpisodes()
                }
            }
        }
    }
}

//#Preview {
//    EpisodesView()
//}
