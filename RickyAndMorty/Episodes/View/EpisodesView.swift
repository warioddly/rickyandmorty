//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct EpisodesView: View {
    
    var viewModel = EpisodesViewModel();
    
    
    init(viewModel: EpisodesViewModel = EpisodesViewModel()) {
        self.viewModel = viewModel
        viewModel.fetchEpisodes()
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.episodes, id: \.self) { item in
                    NavigationLink {
                        SeriesView()
                    } label: {
                        Text(item.name)
                    }
                    .contextMenu {
                        Button("Gulzirek") {  }
                    }
                }
            }
            .navigationTitle("Seasons")
            .background(Color.purple)
            .refreshable {
                viewModel.refreshEpisodes()
            }
        }
    }
}

#Preview {
    EpisodesView()
}
