//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 18/02/23.
//

import UIKit

class PokemonViewController: UIViewController {
    var pokemonBrain = PokemonBrain();
    var list: PokemonListModel? = nil;
    
    lazy var table:UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .plain);
        table.translatesAutoresizingMaskIntoConstraints = false;
        return table;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemon";
        view.backgroundColor = .systemBackground;
        setupNetworking();
        setupTable();
        layout();
    }
}
extension PokemonViewController{
    func setupNetworking(){
        pokemonBrain.delegate = self;
        pokemonBrain.fetchPokemonList();
    }
    func layout(){

    }
    func setupTable(){
        view.addSubview(table);
        table.register(PokemonTableCell.self, forCellReuseIdentifier: PokemonTableCell.identifier);
        table.rowHeight = PokemonTableCell.rowHeight;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = .systemBackground;
        table.allowsSelection = false; //Remove it
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]);
    }
    func setupSearchController(){
        
    }
}

extension PokemonViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pokemons =  list?.results{
            return pokemons.count;
        }else{
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableCell.identifier, for: indexPath) as! PokemonTableCell;
        if let pokemons = list?.results{
            let item = pokemons[indexPath.row];
            cell.configureCell(pokemonModel: item);
        }
        return cell;
    }
}
extension PokemonViewController:UITableViewDelegate{
    
}
//MARK: Actions
extension PokemonViewController{
}
extension PokemonViewController:PokemonBrainDelegate{
    func onSuccess(list: PokemonListModel) {
        self.list = list;
        self.table.reloadData();
    }
    
    func onFailure(errorMessage: String) {
        
    }
}
