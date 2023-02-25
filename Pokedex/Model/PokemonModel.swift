//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import Foundation

struct PokemonModel {
    let name: String
}
struct DreamWorld:Codable {
    let front_default: String
}
struct Other: Codable {
    let dream_world: DreamWorld
}
struct Sprites: Codable {
    let other: Other
}
struct Pokemon: Codable{
    let name: String
    let url: String?
    var capitalizedName:String {
        self.name.capitalized
    }
    var sprites: Sprites?
}

struct PokemonListModel: Codable{
    let count: Int
    let next: String?
    let previous: String?
    var results: [Pokemon]
}
