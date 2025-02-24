//
//  PaginationModel.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 24/2/25.
//
import Foundation

struct PaginationModel: Codable, Hashable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
