//
//  SeriesView.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 4/12/24.
//

class EpisodesViewModel {
    
    var service = EpisodeService()
    var episodes: [EpisodesModel] = []
    
    
    func fetchEpisodes() {
        episodes = service.fetchEpisodes()
    }
    
    func refreshEpisodes() {
        episodes.removeAll()
    }
    
    
}
