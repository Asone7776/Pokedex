//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 18/02/23.
//

import UIKit
import UIScrollView_InfiniteScroll

class PokemonViewController: UIViewController {
    let alerts = Alerts();
    var pokemonBrain = PokemonBrain();
    var list: PokemonListModel? = nil;
    
    lazy var table: UITableView = {
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
    }
}
extension PokemonViewController{
    func setupNetworking(){
        self.showHUD();
        pokemonBrain.fetchPokemonList(url: nil) {list in
            self.onSuccess(newPokemonsData: list);
        }completeWithError: { error in
            self.hideHUD();
            self.alerts.showErrorAlert(message: error) { alert in
                self.present(alert,animated: true);
            }
        }
    }
    func setupTable(){
        view.addSubview(table);
        table.register(PokemonTableCell.self, forCellReuseIdentifier: PokemonTableCell.identifier);
        table.rowHeight = PokemonTableCell.rowHeight;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = .systemBackground;
        table.infiniteScrollDirection = .vertical;
        table.addInfiniteScroll(handler: loadMore(_:))
        
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
        if let pokemons =  list?.results{
            return pokemons.count;
        }else{
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableCell.identifier, for: indexPath) as! PokemonTableCell;
        cell.animateBackground();
        if let pokemons = list?.results{
            let item = pokemons[indexPath.row];
            cell.configureCell(pokemonModel: item);
        }
        return cell;
    }
}
extension PokemonViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        let vc = SinglePokemonViewController();
        vc.modalPresentationStyle = .fullScreen;
        navigationController?.present(vc, animated: true)
    }
}
//MARK: Actions
extension PokemonViewController{
    func loadMore(_ table:UITableView){
        guard let list = list , let next = list.next else{
            table.finishInfiniteScroll();
            return;
        }
        pokemonBrain.fetchPokemonList(url: next) { list in
            self.onSuccess(newPokemonsData: list);
        }completeWithError: { error in
            self.alerts.showErrorAlert(message: error) { alert in
                self.present(alert,animated: true);
            }
        }
    }
    func onSuccess(newPokemonsData: PokemonListModel) {
        if var safeList = list{
            safeList.count = newPokemonsData.count;
            safeList.next = newPokemonsData.next;
            safeList.previous = newPokemonsData.previous;
            safeList.results = safeList.results + newPokemonsData.results;
            list = safeList;
        }else{
            list = newPokemonsData;
        }
        self.table.reloadData();
        table.finishInfiniteScroll();
        self.hideHUD();
    }
}
