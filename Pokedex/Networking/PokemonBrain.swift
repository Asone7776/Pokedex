//
//  PokemonBrain.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 25/02/23.
//

import Foundation
import Alamofire
protocol PokemonBrainDelegate{
    func onSuccess(list: PokemonListModel)
    func onFailure(errorMessage: String)
}

struct PokemonBrain {
    let url = "https://pokeapi.co/api/v2/"
    var delegate: PokemonBrainDelegate?
    func fetchPokemonList(){
        let myGroup = DispatchGroup()
        AF.request("\(url)/pokemon").validate().responseDecodable(of: PokemonListModel.self) { response in
            switch response.result {
            case .success(var list):
                for (index,pokemon) in list.results.enumerated() {
                    myGroup.enter()
                    guard let url = pokemon.url else {
                        return;
                    }
                    AF.request(url).validate().responseDecodable(of:Pokemon.self) { response in
                        switch response.result{
                        case .success(let pokemon):
                            if let sprites = pokemon.sprites{
                                list.results[index].sprites = sprites;
                            }
                        case .failure(let error):
                            print(error.localizedDescription);
                        }
                        myGroup.leave();
                    }
                }
                myGroup.notify(queue: .main) {
                    delegate?.onSuccess(list: list);
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
