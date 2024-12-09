//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import Foundation


struct EpisodeDetailsResponse: Codable {
    let locations: [Episode]
}

class EpisodesDetailsViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    
    func fetchEpisodes() {
        guard let url = URL(string: "\(Constants.BASE_URL)/episode") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(EpisodeResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.episodes = decodedResponse.results
                    }
                } catch {
                    print("Error decoding: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
