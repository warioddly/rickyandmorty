//
//  EpisodeService.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 5/12/24.
//

import Foundation

class EpisodeService {
    
    
    func fetchEpisodes() -> [EpisodesModel] {
        let session = URLSession(configuration: .default)
        let url = URL(string: Constants.BASE_URL + "/api/episode")
        _ = session.dataTask(with: url!) { data, response, error in
            print(data as Any)
        }
        
        return []
   }
    
}
