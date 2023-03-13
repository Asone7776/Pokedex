//
//  SinglePokemonItems.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 08/03/23.
//

import UIKit

class SinglePokemonItems: UIView {
    var items = [PokemonMove]();
    lazy var table: UITableView = {
        let table = UITableView();
        table.dataSource = self;
        table.allowsSelection = false;
        table.translatesAutoresizingMaskIntoConstraints = false;
        return table;
    }();
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup();
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SinglePokemonItems {
    func setup(){
        table.register(SinglePokemonCell.self, forCellReuseIdentifier: SinglePokemonCell.identifier);
        table.rowHeight = SinglePokemonCell.cellHeight;
    }
    func style() {
        isHidden = true;
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(table);
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: table.trailingAnchor, multiplier: 1),
            table.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: table.bottomAnchor, multiplier: 1)
        ]);
    }
    func reload(){
        table.reloadData();
    }
}
extension SinglePokemonItems: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SinglePokemonCell.identifier) as! SinglePokemonCell;
        let row = indexPath.row;
        let item = items[row];
        cell.configure(name: item.move.name, level: prepareLevel(groups: item.version_group_details, index: row));
        return cell;
    }
    private func prepareLevel(groups: [VersionGroup],index: Int ) -> String{
        guard let firstGroup = groups.first else {
            return "Level \(index)";
        }
        return "Level \(firstGroup.level_learned_at)";
    }
}
