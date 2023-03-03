//
//  ItemViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 28/02/23.
//

import UIKit
import UIScrollView_InfiniteScroll

class ItemViewController: UIViewController {
    let alerts = Alerts();
    var pokemonBrain = PokemonBrain();
    var list: ItemListModel? = nil;
    
    lazy var table: UITableView = {
        let table = UITableView(frame: UIScreen.main.bounds, style: .plain);
        table.translatesAutoresizingMaskIntoConstraints = false;
        return table;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Items";
        view.backgroundColor = .systemBackground;
        setupNetworking();
        setupTable();
    }
}
extension ItemViewController{
    func setupNetworking(){
        self.showHUD();
        pokemonBrain.fetchItemsList(url: nil) {list in
            self.onSuccess(newItemsData: list);
        }completeWithError: { error in
            self.hideHUD();
            self.alerts.showErrorAlert(message: error) { alert in
                self.present(alert,animated: true);
            }
        }
    }
    func setupTable(){
        view.addSubview(table);
        table.register(ItemTableCell.self, forCellReuseIdentifier: ItemTableCell.identifier);
        table.rowHeight = ItemTableCell.rowHeight;
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

extension ItemViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pokemons =  list?.results{
            return pokemons.count;
        }else{
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableCell.identifier, for: indexPath) as! ItemTableCell;
        cell.animateBackground();
        if let items = list?.results{
            let item = items[indexPath.row];
            cell.configureCell(itemModel: item);
        }
        return cell;
    }
}
extension ItemViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
}

//MARK: Actions
extension ItemViewController{
    func loadMore(_ table:UITableView){
        guard let list = list , let next = list.next else{
            table.finishInfiniteScroll();
            return;
        }
        pokemonBrain.fetchItemsList(url: next) { list in
            self.onSuccess(newItemsData: list);
        }completeWithError: { error in
            self.alerts.showErrorAlert(message: error) { alert in
                self.present(alert,animated: true);
            }
        }
    }
    func onSuccess(newItemsData: ItemListModel) {
        if var safeList = list{
            safeList.count = newItemsData.count;
            safeList.next = newItemsData.next;
            safeList.previous = newItemsData.previous;
            safeList.results = safeList.results + newItemsData.results;
            list = safeList;
        }else{
            list = newItemsData;
        }
        self.table.reloadData();
        table.finishInfiniteScroll();
        self.hideHUD();
    }
}
