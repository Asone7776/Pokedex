//
//  SpriteView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 07/03/23.
//

import UIKit

class SpriteView: UIView {
    
    let label:UILabel = {
        let label = UILabel();
        label.stylePokemonLabel();
        label.font = UIFont(name: "Aenir", size: 15);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let pokemonImage:UIImageView = {
        let imageView = UIImageView();
        imageView.contentMode = .scaleAspectFit;
        imageView.image = UIImage(named: "squirtle");
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView;
    }();
    
    init(frame: CGRect,imageName:String,labelText: String = "Sprite") {
        super.init(frame: frame)
        label.text = labelText;
        pokemonImage.image = UIImage(named: imageName);
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 150)
    }
}

extension SpriteView {
    func layout() {
        addSubview(label);
        addSubview(pokemonImage);
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: label.trailingAnchor),
            
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImage.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 2),
            pokemonImage.widthAnchor.constraint(equalToConstant: 100),
            pokemonImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
