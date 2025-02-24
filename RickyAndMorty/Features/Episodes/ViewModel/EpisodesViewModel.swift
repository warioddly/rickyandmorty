//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

import Foundation


struct EpisodeResponse: Codable {
    let results: [Episode]
    let info: PaginationModel
}

@MainActor
class EpisodesViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    private var pagination: PaginationModel? = nil;
    
    func fetchEpisodes() async {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/episode") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(EpisodeResponse.self, from: data)
            self.episodes = decodedResponse.results
            self.pagination = decodedResponse.info
        }
        catch {
            print("Error decoding: \(error.localizedDescription)")
        }
    }
    
    
    func loadMoreEpisodes() async {
        if (pagination == nil || pagination?.next == nil) {
            return;
        }
        
        guard let url = URL(string: pagination!.next!) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(EpisodeResponse.self, from: data)
            self.episodes += decodedResponse.results
            self.pagination = decodedResponse.info
        } catch {
            print("Error decoding: \(error.localizedDescription)")
        }
    }
    
}
