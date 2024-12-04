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
            List {
                ForEach(listItems(), id: \.self) { item in
                    Text(item.name)
                        .swipeActions(edge: .leading) {
                            Button(role: .cancel) {
                                // code to like goes here
                            } label: {
                                Label("Favorite", systemImage: "flag")
                            }
                            .tint(.indigo)
                        }
                        .swipeActions(allowsFullSwipe: false) {
                            Button(role: .destructive) {
//                                oceans.remove(item)
                            } label: {
                              Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                    
                              } label: {
                                Label("Toggle Read", systemImage: "envelope.open.fill")
                              }
                            
                        }
                }
            }
            .navigationTitle("Ocean")
            .toolbar { EditButton() }
            .background(Color.purple)
        }
        .searchable(text: $searchText)
    }
    
    
    private func listItems() -> [Ocean] {
        return oceans.filter { searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased()) };
    }
    
    private func deleteItem(at offsets: IndexSet) {
        oceans.remove(atOffsets: offsets)
     }
    
}

#Preview {
    ContentView()
}
