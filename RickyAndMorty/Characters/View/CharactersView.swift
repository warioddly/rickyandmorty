//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct CharactersView: View {
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(Constants.TestList, id: \.self) { item in
                    NavigationLink {
                        CharacterView()
                    } label: {
                        Text(item)
                    }
                }
                
            }
            .navigationTitle("Characters")
            .background(Color.purple)
        }
    }
}

#Preview {
    SeriesView()
}
