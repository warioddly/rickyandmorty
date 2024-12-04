//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct SeriesView: View {
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(Constants.TestList, id: \.self) { item in
                    NavigationLink {
                        ContentView()
                    } label: {
                        Text(item)
                    }
                }
                
            }
            .navigationTitle("Series")
            .toolbar { EditButton() }
            .background(Color.purple)
        }
    }
}

#Preview {
    SeriesView()
}
