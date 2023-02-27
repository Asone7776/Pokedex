//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import Foundation

//MARK: Main Models
struct Pokemon: Decodable{
    let name: String
    let url: String?
    var capitalizedName:String {
        self.name.capitalized
    }
    var sprites: Sprites?
    var types: [Types]?
}

struct PokemonListModel: Decodable{
    var count: Int
    var next: String?
    var previous: String?
    var results: [Pokemon]
}


//MARK: Inner Models
struct PokemonModel {
    let name: String
}
struct OfficialArtwork: Codable {
    let front_default: String
}
struct Other: Codable {
    let officialArtwork: OfficialArtwork
    enum CodingKeys: String, CodingKey {
          case officialArtwork = "official-artwork"
      }
}
struct SingleType: Decodable {
    let name: String
}
struct Types: Decodable{
    let type: SingleType
}
struct Sprites: Decodable {
    let other: Other
}

