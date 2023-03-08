//
//  SinglePokemonItems.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 08/03/23.
//

import UIKit

class SinglePokemonItems: UIView {
    lazy var table: UITableView = {
        let table = UITableView();
        table.dataSource = self;
        table.allowsSelection = false;
        table.translatesAutoresizingMaskIntoConstraints = false;
        return table;
    }();
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SinglePokemonItems {
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
}
extension SinglePokemonItems: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        var configuration = cell.defaultContentConfiguration();
        configuration.text = "Text-\(indexPath.row)";
        cell.contentConfiguration = configuration;
        return cell;
    }
}
