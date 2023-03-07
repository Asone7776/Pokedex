//
//  SpritesView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 07/03/23.
//

import UIKit

class SpritesView: UIView {
    
    let label:UILabel = {
        let label = UILabel();
        label.stylePokemonLabel();
        label.text = "Sprites";
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let stackView:UIStackView = {
        let stack = UIStackView();
        stack.axis = .horizontal;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.distribution = .fillEqually
        return stack;
    }();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpritesView {
    func layout() {
        addSubview(label);
        stackView.addArrangedSubview(SpriteView(frame: .zero, imageName: "squirtle",labelText: "Normal"));
        stackView.addArrangedSubview(SpriteView(frame: .zero, imageName: "squirtle-shiny",labelText: "Shiny"))
        addSubview(stackView);
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 2),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ]);
    }
}
