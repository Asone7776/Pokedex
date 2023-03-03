//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 18/02/23.
//

import UIKit
import UIScrollView_InfiniteScroll

class MoveViewController: UIViewController {
    let alerts = Alerts();
    var pokemonBrain = PokemonBrain();
    var list: MoveListModel? = nil;
    
    lazy var table: UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .plain);
        table.translatesAutoresizingMaskIntoConstraints = false;
        return table;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Moves";
        view.backgroundColor = .systemBackground;
        setupNetworking();
        setupTable();
    }
}
extension MoveViewController{
    func setupNetworking(){
        self.showHUD();
        pokemonBrain.fetchMovesList(url: nil) {list in
            self.onSuccess(newMovesData: list);
        }completeWithError: { error in
            self.hideHUD();
            self.alerts.showErrorAlert(message: error) { alert in
                self.present(alert,animated: true);
            }
        }
    }
    func setupTable(){
        view.addSubview(table);
        table.register(MoveTableCell.self, forCellReuseIdentifier: MoveTableCell.identifier);
        table.rowHeight = MoveTableCell.rowHeight;
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
    func setupSearchController(){
        
    }
}

extension MoveViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pokemons =  list?.results{
            return pokemons.count;
        }else{
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoveTableCell.identifier, for: indexPath) as! MoveTableCell;
        cell.animateBackground();
        if let moves = list?.results{
            let item = moves[indexPath.row];
            cell.configureCell(moveModel: item);
        }
        return cell;
    }
}
extension MoveViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
}

//MARK: Actions
extension MoveViewController{
    func loadMore(_ table:UITableView){
        guard let list = list , let next = list.next else{
            table.finishInfiniteScroll();
            return;
        }
        pokemonBrain.fetchMovesList(url: next) { list in
            self.onSuccess(newMovesData: list);
        }completeWithError: { error in
            self.alerts.showErrorAlert(message: error) { alert in
                self.present(alert,animated: true);
            }
        }
    }
    func onSuccess(newMovesData: MoveListModel) {
        if var safeList = list{
            safeList.count = newMovesData.count;
            safeList.next = newMovesData.next;
            safeList.previous = newMovesData.previous;
            safeList.results = safeList.results + newMovesData.results;
            list = safeList;
        }else{
            list = newMovesData;
        }
        self.table.reloadData();
        table.finishInfiniteScroll();
        self.hideHUD();
    }
}
