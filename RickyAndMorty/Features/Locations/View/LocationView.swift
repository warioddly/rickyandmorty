//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct LocationView: View {
    
    let location: Location
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                Text("Dimension \(location.dimension)")
                Text("Type \(location.type)")
                
                if (!location.residents.isEmpty) {
                    NavigationLink(destination: CharactersView(characters: location.residents)) {
                        Text("See location residents")
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle(location.name)
    }
}
