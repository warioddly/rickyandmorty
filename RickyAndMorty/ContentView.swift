//
//  ContentView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 2/12/24.
//

import SwiftUI

struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}


private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]



struct ContentView: View {
    
    @State private var searchText = ""
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        NavigationStack {
            List(oceans, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Ocean")
            .toolbar { EditButton() }
            Text("\(searchText)")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ContentView()
}
