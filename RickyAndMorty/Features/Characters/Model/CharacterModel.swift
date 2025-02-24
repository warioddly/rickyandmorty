//
//  Episodes.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 5/12/24.
//

struct Character: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let image: String
    let status: String
    let gender: String
    let species: String
    let url: String
    let created: String
}
