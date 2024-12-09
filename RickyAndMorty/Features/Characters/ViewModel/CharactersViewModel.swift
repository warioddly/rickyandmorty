//
//  CharacterViewModel.swift
//  RickyAndMorty
//
//  Created by GØDØFIMØ on 23/2/25.
//
import Foundation

struct CharactersResponse: Codable {
    let results: [Character]
}

class CharactersViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    
    func fetchCharacters() {
        guard let url = URL(string: "\(Constants.BASE_URL)/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.characters = decodedResponse.results
                    }
                } catch {
                    print("Error decoding: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
    func fetchCharactersById(ids: [String]) {
        guard let url = URL(string: "\(Constants.BASE_URL)/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.characters = decodedResponse.results
                    }
                } catch {
                    print("Error decoding: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
}
