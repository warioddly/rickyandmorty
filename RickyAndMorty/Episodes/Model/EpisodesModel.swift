//
//  Episodes.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 5/12/24.
//


struct EpisodesModel: Hashable {
    
    /// The id of the episode.
    var id: Int
    
    /// The name of the episode.
    var name: String
    
    /// The air date of the episode.
    var air_date: String
    
    /// The code of the episode.
    var episode: String
    
    /// List of characters who have been seen in the episode.
    var characters: [String]
    
    /// Link to the episode's own endpoint.
    var url: String
    
    /// Time at which the episode was created in the database.
    var created: String
    
    
    init(id: Int, name: String, air_date: String, episode: String, characters: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.air_date = air_date
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
    
    
}
