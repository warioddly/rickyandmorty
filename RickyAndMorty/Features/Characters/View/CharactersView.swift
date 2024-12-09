//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject private var viewModel = CharactersViewModel();
    
    var body: some View {
        NavigationStack {
            List(viewModel.characters) { character in
                NavigationLink(
                    destination: CharacterView(character: character)
                        .toolbar(.hidden, for: .tabBar)
                ) {
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                        .padding(.trailing, 12)
                        
                        VStack (alignment: .leading) {
                            Text(character.name)
                                .font(.headline)
                            Text(character.status)
                                .font(.caption)
                        }
                    }
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    CharactersView()
}
