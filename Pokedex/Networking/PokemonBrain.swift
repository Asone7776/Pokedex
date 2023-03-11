//
//  PokemonBrain.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 25/02/23.
//

import Foundation
import Alamofire
import PromisedFuture

struct PokemonBrain {
    let pokemonUrl = "https://pokeapi.co/api/v2/pokemon?limit=20"
    let movesUrl = "https://pokeapi.co/api/v2/move?limit=20"
    let itemsUrl = "https://pokeapi.co/api/v2/item?limit=20"
    typealias Response<T> = (_ result: AFResult<T>) -> Void
    func fetchPokemonList(url: String?, completion: @escaping (PokemonListModel) -> Void,completeWithError: @escaping (String) -> Void){
        let myGroup = DispatchGroup()
        AF.request(url ?? pokemonUrl).validate().responseDecodable(of: PokemonListModel.self) { response in
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
                            if let stats = pokemon.stats{
                                var statsWithIndex:[Stats] = [];
                                for (index,stat) in stats.enumerated() {
                                    statsWithIndex.append(Stats(index:index,base_stat: stat.base_stat, effort: stat.effort, stat: stat.stat))
                                }
                                list.results[index].stats = statsWithIndex;
                            }
                        case .failure(let error):
                            completeWithError(error.localizedDescription);
                        }
                        myGroup.leave();
                    }
                }
                myGroup.notify(queue: .main) {
                    completion(list);
                }
            case .failure(let error):
                completeWithError(error.localizedDescription);
            }
        }
    }
    
    func fetchMovesList(url: String?, completion: @escaping (MoveListModel) -> Void,completeWithError: @escaping (String) -> Void){
        let myGroup = DispatchGroup()
        AF.request(url ?? movesUrl).validate().responseDecodable(of: MoveListModel.self) { response in
            switch response.result {
            case .success(var list):
                for (index,move) in list.results.enumerated() {
                    myGroup.enter()
                    guard let url = move.url else {
                        return;
                    }
                    AF.request(url).validate().responseDecodable(of:Move.self) { response in
                        switch response.result{
                        case .success(let move):
                            if let type = move.type{
                                list.results[index].type = type;
                            }
                        case .failure(let error):
                            completeWithError(error.localizedDescription);
                        }
                        myGroup.leave();
                    }
                }
                myGroup.notify(queue: .main) {
                    completion(list);
                }
            case .failure(let error):
                completeWithError(error.localizedDescription);
            }
        }
    }
    func fetchItemsList(url: String?, completion: @escaping (ItemListModel) -> Void,completeWithError: @escaping (String) -> Void){
        let myGroup = DispatchGroup()
        AF.request(url ?? itemsUrl).validate().responseDecodable(of: ItemListModel.self) { response in
            switch response.result {
            case .success(var list):
                for (index,item) in list.results.enumerated() {
                    myGroup.enter()
                    guard let url = item.url else {
                        return;
                    }
                    AF.request(url).validate().responseDecodable(of:Item.self) { response in
                        switch response.result{
                        case .success(let item):
                            if let cost = item.cost{
                                list.results[index].cost = cost;
                            }
                            if let sprite = item.sprites{
                                list.results[index].sprites = sprite;
                            }
                        case .failure(let error):
                            completeWithError(error.localizedDescription);
                        }
                        myGroup.leave();
                    }
                }
                myGroup.notify(queue: .main) {
                    completion(list);
                }
            case .failure(let error):
                completeWithError(error.localizedDescription);
            }
        }
    }
    func performRequest<T:Decodable>(url:String, decoder: JSONDecoder = JSONDecoder()) -> Future<T, Error> {
        return Future(operation: { completion in
            AF.request(url).responseDecodable { (response: DataResponse<T,AFError>)  in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        })
    }
    
    func fetchList() -> Future<PokemonListModel,Error>{
        return performRequest(url: pokemonUrl);
    }
    func fetchPokemons(list:PokemonListModel)->Future<PokemonListModel,Error>{
        var copy = list;
        let myGroup = DispatchGroup();
        return Future { completion in
            for (index, pokemon) in list.results.enumerated(){
                myGroup.enter();
                guard let url = pokemon.url else{
                    return;
                }
                performRequest(url: url).execute { (result:Pokemon) in
                    if let sprites = result.sprites{
                        copy.results[index].sprites = sprites;
                    }
                    print(pokemon);
                    if let types = pokemon.types{
                        
                        copy.results[index].types = types;
                    }
                    myGroup.leave();
                }
            }
            myGroup.notify(queue: .main){
                completion(.success(copy));
            }
        }
    }
}
