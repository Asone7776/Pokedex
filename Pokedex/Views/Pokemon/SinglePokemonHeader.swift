//
//  SinglePokemonHeader.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 01/03/23.
//

import UIKit

class SinglePokemonHeader: UIView {
    let pokemonImage:UIImageView = {
        let imageView = UIImageView();
        imageView.contentMode = .scaleAspectFit;
        imageView.image = UIImage(named: "squirtle");
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView;
    }();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        style();
        layout();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        style();
        layout();
    }
}

extension SinglePokemonHeader {
    func style() {
//        translatesAutoresizingMaskIntoConstraints = false
//        clipsToBounds = true
        layer.cornerRadius = 48
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundColor = .clear;
    }
    
    func layout() {
        addSubview(pokemonImage);
        NSLayoutConstraint.activate([
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
//            pokemonImage.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
