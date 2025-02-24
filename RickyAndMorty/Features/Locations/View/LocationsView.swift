//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import SwiftUI

struct LocationsView: View {
    
    @StateObject private var viewModel = LocationsViewModel()
       
    var body: some View {
        NavigationStack {
            List(viewModel.locations) { location in
                NavigationLink(
                    destination: LocationView(location: location)
                ) {
                    VStack (alignment: .leading) {
                        Text(location.name)
                            .font(.headline)
                        Text(location.dimension)
                            .font(.subheadline)
                        Text(location.created)
                            .font(.caption)
                    }
                }
                .padding(.vertical, 5)
                .onAppear {
                    Task {
                        if location == viewModel.locations.last {
                            await viewModel.loadMoreLocations()
                        }
                    }
                }
            }
            .navigationTitle("Locations")
            .onAppear {
                Task {
                    await viewModel.fetchLocations()
                }
            }
        }
    }
}

//#Preview {
//    LocationsView()
//}
