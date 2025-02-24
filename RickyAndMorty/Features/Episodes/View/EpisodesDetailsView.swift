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
            
            VStack(alignment: .leading) {
                Text("Episode \(episode.episode)")
                Text("Air date \(episode.air_date)")
                
                if (!episode.characters.isEmpty) {
                    NavigationLink(destination: CharactersView(characters: episode.characters)) {
                        Text("See episode characters")
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle(episode.name)
    }
}
