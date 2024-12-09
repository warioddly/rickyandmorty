//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct EpisodeDetailView: View {
    
    let episode: Episode
    
    var body: some View {
        NavigationStack {
            
            Text("Hello \(episode)")
            
            if (!episode.characters.isEmpty) {
                Text("dawd")
            }
            
        }
        .padding(.horizontal)
        .navigationTitle(episode.name)
    }
}

#Preview {
    EpisodeDetailView(episode: Episode(
        id: 1,
        name: "Rick",
        episode: "Episode 1",
        air_date: "12/12/12",
        characters: [
            "-"
        ]
    ));
}
