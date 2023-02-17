//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 18/02/23.
//

import UIKit

class PokemonViewController: UIViewController {
    
    let pokemons = [
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
        PokemonModel(name: "Pikachu"),
    ];
    
    let table:UITableView = {
        let table = UITableView();
        table.translatesAutoresizingMaskIntoConstraints = false;
        return table;
    }();

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemon";
        view.backgroundColor = .systemBackground;
        setupTable();
        layout();        
    }
}
extension PokemonViewController{
    func layout(){
     
    }
    func setupTable(){
        view.addSubview(table);
        table.register(PokemonTableCell.self, forCellReuseIdentifier: Constants.PokemonCellIdentifier);
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = .systemBackground;
        if #available(iOS 15.0, *) {
            table.sectionHeaderTopPadding = .zero
        }
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]);
    }
}

extension PokemonViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PokemonCellIdentifier, for: indexPath) as! PokemonTableCell;
        let item = pokemons[indexPath.row];
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = item.name
        cell.contentConfiguration = contentConfiguration;
        return cell;
    }
}
extension PokemonViewController:UITableViewDelegate{
    
}
