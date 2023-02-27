//
//  MoveModel.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 27/02/23.
//

import Foundation

struct MoveType: Decodable{
    var name: String
}

struct Move: Decodable {
    let name: String
    let url: String?
    var type: MoveType?
    var capitalizedName: String {
        self.name.capitalized
    }
}

struct MoveListModel: Decodable{
    var count:Int
    var next:String?
    var previous:String?
    var results: [Move]
}
