//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import Foundation

struct LocationsResponse: Codable {
    let results: [Location]
    let info: PaginationModel
}

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    private var pagination: PaginationModel? = nil
    
    func fetchLocations() async {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/location") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(LocationsResponse.self, from: data)
            self.locations = decodedResponse.results
            self.pagination = decodedResponse.info
        }
        catch {
            print("Error decoding: \(error.localizedDescription)")
        }
    }
    
    
    func loadMoreLocations() async {
        if (pagination == nil || pagination?.next == nil) {
            return;
        }
        
        guard let url = URL(string: pagination!.next!) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(LocationsResponse.self, from: data)
            self.locations += decodedResponse.results
            self.pagination = decodedResponse.info
        } catch {
            print("Error decoding: \(error.localizedDescription)")
        }
    }
   
}
