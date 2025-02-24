//
//  Episodes.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 5/12/24.
//

struct Location: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
