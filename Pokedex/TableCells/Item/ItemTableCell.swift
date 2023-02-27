//
//  ItemTableCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 28/02/23.
//

import UIKit
import SDWebImage

class ItemTableCell: UITableViewCell {
    static let identifier = "ItemCell";
    static let rowHeight: CGFloat = 75;
    
    lazy var pokemonImage: UIImageView = {
        let view = UIImageView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.contentMode = .scaleAspectFit;
        return view;
    }();
    
    lazy var nameLabel: UILabel = {
        let label = UILabel();
        label.text = "Test"
        label.font = .boldSystemFont(ofSize: 15);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    lazy var costLabel: UILabel = {
        let label = UILabel();
        label.text = "cost"
        label.font = .boldSystemFont(ofSize: 15);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ItemTableCell{
    func layout(){
        addSubview(pokemonImage);
        addSubview(nameLabel);
        addSubview(costLabel);
        NSLayoutConstraint.activate([
            pokemonImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            pokemonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 50),
            pokemonImage.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: pokemonImage.trailingAnchor, multiplier: 1),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: costLabel.trailingAnchor, multiplier: 2),
            costLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]);
    }
    func configureCell(itemModel:Item){
        nameLabel.text = itemModel.capitalizedName;
        if let cost = itemModel.cost {
            costLabel.text = "\(cost)$";
        }
        if let sprite = itemModel.sprites{
            let imageUrl = URL(string: sprite.defaultImage);
            if let url = imageUrl{
                pokemonImage.sd_imageIndicator = SDWebImageActivityIndicator.gray;
                pokemonImage.sd_setImage(with: url);
            }
        }
    }
}
