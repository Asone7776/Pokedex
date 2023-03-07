//
//  AbilitiesView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 07/03/23.
//

import UIKit

class AbilitiesView: UIView {
    
    let label:UILabel = {
        let label = UILabel();
        label.stylePokemonLabel();
        label.text = "Abilities";
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let stackView:UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.spacing = 10;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.distribution = .equalSpacing
        return stack;
    }();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension AbilitiesView {
    func layout() {
        addSubview(label);
        stackView.addArrangedSubview(AbilityView(title: "Torrents", text: "Powers up Water-tpe moves when the Pokémon is in trouble."));
        stackView.addArrangedSubview(Separator());
        stackView.addArrangedSubview(AbilityView(title: "Rain dish", text: "The Pokémon gradually regains HP in rain."))
        addSubview(stackView);
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}
