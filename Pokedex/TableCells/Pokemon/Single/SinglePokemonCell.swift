//
//  SinglePokemonCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 13/03/23.
//

import UIKit

class SinglePokemonCell: UITableViewCell {
    static let identifier = "singlePokemonMoves";
    static let cellHeight: CGFloat = 75.0;
    let stack:UIStackView = {
        let stack = UIStackView();
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.spacing = 5;
        stack.axis = .vertical;
        return stack;
    }();
    
    let nameLabel:UILabel = {
        let label = UILabel();
        label.font = .systemFont(ofSize: 19);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    let levelLabel:UILabel = {
        let label = UILabel();
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.textColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.00);
        return label;
    }();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SinglePokemonCell{
    private func layout(){
        stack.addArrangedSubview(nameLabel);
        stack.addArrangedSubview(levelLabel);
        addSubview(stack);
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]);
    }
    func configure(name: String, level: String){
        nameLabel.text = name.capitalized;
        levelLabel.text = level;
    }
}
