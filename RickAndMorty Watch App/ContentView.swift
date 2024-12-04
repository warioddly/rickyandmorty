//
//  ContentView.swift
//  RickAndMorty Watch App
//
//  Created by GØDØFIMØ on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("IMANKADYR")
            Image("ELQR MBANK")
                .resizable()
                .frame(
                    width: 150,
                    height: 150,
                    alignment: .center
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
