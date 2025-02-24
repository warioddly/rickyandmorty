//
//  CharacterViewModel.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 23/2/25.
//
import Foundation

struct CharactersResponse: Codable {
    let info: PaginationModel
    let results: [Character]
}

@MainActor
class CharactersViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    private var pagination: PaginationModel? = nil;
    
    func fetchCharacters() async {
        guard let url = URL(string: "\(Constants.BASE_URL)/character") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
            self.characters = decodedResponse.results
            self.pagination = decodedResponse.info
        } catch {
            print("Error decoding: \(error.localizedDescription)")
        }
    }
    
    
    func loadMoreCharacters() async {
        if (pagination == nil || pagination?.next == nil) {
            return;
        }
        
        guard let url = URL(string: pagination!.next!) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
            self.characters += decodedResponse.results
            self.pagination = decodedResponse.info
        } catch {
            print("Error decoding: \(error.localizedDescription)")
        }
    }
    
    
    func fetchCharactersById(ids: [String]) async {
        let indices = ids.compactMap { URL(string: $0)?.lastPathComponent }.joined(separator: ",")
        
        guard let url = URL(string: "\(Constants.BASE_URL)/character/\(indices)") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            self.characters = try JSONDecoder().decode([Character].self, from: data)
        } catch {
            print("Error decoding: \(error.localizedDescription)")
        }
    }
    
}
