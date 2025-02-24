//
//  Episodes.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 5/12/24.
//

struct Episode: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let episode: String
    let air_date: String
    let characters: [String]
    let url: String
    let created: String
}
