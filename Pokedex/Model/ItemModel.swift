//
//  ItemModel.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 28/02/23.
//

import Foundation

struct Sprite: Decodable {
    let defaultImage: String
    enum CodingKeys: String, CodingKey {
          case defaultImage = "default"
      }
}

struct Item: Decodable {
    let name: String
    let url: String?
    var cost: Int?
    var sprites: Sprite?
    var capitalizedName: String {
        self.name.capitalized
    }
}

struct ItemListModel: Decodable{
    var count:Int
    var next:String?
    var previous:String?
    var results: [Item]
}
