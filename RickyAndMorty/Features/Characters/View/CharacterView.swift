//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct CharacterView: View {
    
    let character: Character
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            
            Text(character.name)
                .font(.title)
                .bold()
            
            Text("Status: \(character.status)")
            Text("Gender: \(character.gender)")
        }
        .padding(.horizontal)
        .navigationTitle(character.name)
    }
}
