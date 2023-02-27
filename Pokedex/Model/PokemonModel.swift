//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import Foundation

//MARK: Main Models
struct Pokemon: Codable{
    let name: String
    let url: String?
    var capitalizedName:String {
        self.name.capitalized
    }
    var sprites: Sprites?
    var types: [Types]?
}

struct PokemonListModel: Codable{
    var count: Int
    var next: String?
    var previous: String?
    var results: [Pokemon]
}


//MARK: Inner Models
struct PokemonModel {
    let name: String
}
struct OfficialArtwork:Codable {
    let front_default: String
}
struct Other: Codable {
    let officialArtwork: OfficialArtwork
    enum CodingKeys: String, CodingKey {
          case officialArtwork = "official-artwork"
      }
}
struct SingleType:Codable {
    let name: String
}
struct Types: Codable{
    let type: SingleType
}
struct Sprites: Codable {
    let other: Other
}

