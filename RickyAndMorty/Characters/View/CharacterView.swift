//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct CharacterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text("WARIODDLY")
            Button(action: {
              dismiss()
           }) {
              Label("Back", systemImage: "arrow.left.circle")
          }
        }
        .navigationTitle("Warioddly")
        .toolbar {
            Button("More information", action: {})
        }
        .background(Color.purple)
    }
}

#Preview {
    SeriesView()
}
