//
//  SinglePokemonHeader.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 01/03/23.
//

import UIKit
import SDWebImage

class SinglePokemonHeader: UIView {
    let pokemonImage:UIImageView = {
        let imageView = UIImageView();
        imageView.contentMode = .scaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView;
    }();
    
    init(frame: CGRect,sprites: Sprites?) {
        super.init(frame: frame);
        configureImage(sprites:sprites);
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
        layer.cornerRadius = 48
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundColor = .clear;
    }
    
    func layout() {
        addSubview(pokemonImage);
        NSLayoutConstraint.activate([
            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 170),
            pokemonImage.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    func configureImage(sprites:Sprites?){
        if let sprite = sprites{
            let imageUrl = URL(string: sprite.other.officialArtwork.front_default);
                if let url = imageUrl{
                    pokemonImage.sd_imageIndicator = SDWebImageActivityIndicator.gray;
                    pokemonImage.sd_setImage(with: url);
                }
        }
    }
}
