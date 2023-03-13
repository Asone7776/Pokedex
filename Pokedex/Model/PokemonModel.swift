//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import Foundation
import Charts
//MARK: Main Models
struct Pokemon: Decodable{
    let name: String
    let url: String?
    var capitalizedName:String {
        self.name.capitalized
    }
    var sprites: Sprites?
    var types: [Types]?
    var stats: [Stats]?
    var abilities: [Ability]?
    var species: Species?
    var moves: [PokemonMove]?
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
    let front_shiny: String
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

struct Ability: Decodable {
    let ability: SingleAbility
}
struct SingleAbility:Decodable{
    let name: String
    let url: String
}



struct Stats:Decodable{
    var index:Int?
    let base_stat:Int
    let effort: Int
    let stat: Stat
    func transformToBarChartDataEntry() -> BarChartDataEntry {
        let entry = BarChartDataEntry(x: Double(index ?? 0), y: Double(base_stat))
        return entry
    }
}
struct Stat:Decodable{
    let name:String
    var capitalizedName: String {
        name.capitalized
    }
    func getShortCut() -> String{
        switch name{
        case "speed":
            return "SPD";
        case "special-defense":
            return "SDEF";
        case "special-attack":
            return "SATK";
        case "defense":
            return "DEF";
        case "attack":
            return "ATK";
        case "hp":
            return "HP";
        default:return "";
        }
    }
}

struct Species: Decodable{
    let url:String
}
struct FlavorTextEntries:Decodable{
    let flavor_text: String
    let language:Language
}
struct Color: Decodable{
    let name: String
}
struct FullSpecies: Decodable{
    let color: Color
    let flavor_text_entries: [FlavorTextEntries]
}

struct Language:Decodable{
    let name: String
}

struct FullAbility: Decodable{
    let name: String
    let flavor_text_entries: [FlavorTextEntries]
}
struct PokemonMove: Decodable{
    let move: SingleMove
    let version_group_details: [VersionGroup]
}
struct SingleMove: Decodable{
    let name: String
}
struct VersionGroup:Decodable{
    let level_learned_at: Int
}
