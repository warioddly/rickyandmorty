//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import Foundation

struct LocationsResponse: Codable {
    let results: [Location]
}

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location] = []
    
    func fetchLocations() {
        guard let url = URL(string: "\(Constants.BASE_URL)/location") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(LocationsResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.locations = decodedResponse.results
                    }
                } catch {
                    print("Error decoding: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
   
}
