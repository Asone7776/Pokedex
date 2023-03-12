//
//  SpriteView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 07/03/23.
//

import UIKit
import SDWebImage
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
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView;
    }();
    
    init(frame: CGRect,labelText: String = "Sprite",imageUrl:String,selectedColor:UIColor?) {
        super.init(frame: frame)
        label.text = labelText;
        configureImage(url: imageUrl);
        layout()
        if let selectedColor = selectedColor{
            label.textColor = selectedColor;
        }
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
    func configureImage(url:String){
        let imageUrl = URL(string: url);
            if let url = imageUrl{
                pokemonImage.sd_imageIndicator = SDWebImageActivityIndicator.gray;
                pokemonImage.sd_setImage(with: url);
            }
    }
}
