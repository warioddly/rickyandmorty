//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct CharactersView: View {
    
    var characters: [String] = [];
    @StateObject private var viewModel = CharactersViewModel();
    
    var body: some View {
        NavigationStack {
            if (!viewModel.characters.isEmpty) {
                List(viewModel.characters) { character in
                    NavigationLink(
                        destination: CharacterView(character: character)
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
                                Text("\(character.status) - \(character.species)")
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.vertical, 5)
                    .onAppear {
                        if character == viewModel.characters.last {
                            Task {
                                await viewModel.loadMoreCharacters()
                            }
                        }
                    }
                }
                .navigationTitle("Characters")
            }
            else {
                ProgressView()
                    .onAppear {
                        Task {
                            characters.isEmpty
                                ? await viewModel.fetchCharacters()
                                : await viewModel.fetchCharactersById(ids: characters)
                        }
                    }
            }
        }
        
    }
}

//#Preview {
//    CharactersView()
//}
