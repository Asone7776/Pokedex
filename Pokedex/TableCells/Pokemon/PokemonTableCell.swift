//
//  PokemonTableCellTableViewCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import UIKit
import SDWebImage

class PokemonTableCell: UITableViewCell {
    static let identifier = "PokemonCell";
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
    
    let stackView:UIStackView = {
        let stack = UIStackView();
        stack.axis = .horizontal;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.spacing = 10;
        return stack;
    }();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PokemonTableCell{
    func layout(){
        addSubview(pokemonImage);
        addSubview(nameLabel);
        addSubview(stackView);
        NSLayoutConstraint.activate([
            pokemonImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            pokemonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 50),
            pokemonImage.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: pokemonImage.trailingAnchor, multiplier: 1),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]);
    }
    func configureCell(pokemonModel:Pokemon){
        stackView.removeAllArrangedSubviews();
        nameLabel.text = pokemonModel.capitalizedName;
        if let sprites = pokemonModel.sprites{
            let imageUrl = URL(string: sprites.other.officialArtwork.front_default);
            if let url = imageUrl{
                pokemonImage.sd_imageIndicator = SDWebImageActivityIndicator.gray;
                pokemonImage.sd_setImage(with: url);
            }
        }
        if let types = pokemonModel.types {
            if !types.isEmpty{
                types.forEach { type in
                    if stackView.subviews.count < 2{
                        stackView.addArrangedSubview(TypeView(typeName: type.type.name));
                    }
                }
            }
        }
    }
    func animateBackground(){
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00);
        self.selectedBackgroundView = backgroundView;
    }
}
