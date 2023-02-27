//
//  PokemonBrain.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 25/02/23.
//

import Foundation
import Alamofire
protocol PokemonBrainDelegate{
    func onSuccess(newPokemonsData: PokemonListModel)
    func onFailure(errorMessage: String)
}

struct PokemonBrain {
    let initialParameters:Parameters = [
        "limit": 20,
        "offset": 0
    ];
    let initialUrl = "https://pokeapi.co/api/v2/pokemon?limit=20"
    var delegate: PokemonBrainDelegate?
    func fetchPokemonList(url: String?){
        let myGroup = DispatchGroup()
        AF.request(url ?? initialUrl).validate().responseDecodable(of: PokemonListModel.self) { response in
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
                            if let types = pokemon.types{
                                list.results[index].types = types;
                            }
                        case .failure(let error):
                            print(error.localizedDescription);
                        }
                        myGroup.leave();
                    }
                }
                myGroup.notify(queue: .main) {
                    delegate?.onSuccess(newPokemonsData: list);
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
