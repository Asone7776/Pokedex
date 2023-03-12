//
//  AbilitiesView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 07/03/23.
//

import UIKit

class AbilitiesView: UIView {
    var selectedColor:UIColor?{
        didSet{
            label.textColor = selectedColor;
        }
    };
    lazy var label:UILabel = {
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
    func configureAbilities(abilities:[FullAbility]?){
        if let abilities = abilities{
            for (index,ability) in abilities.enumerated(){
                var text = "";
                guard let englishFlavor = ability.flavor_text_entries.filter({$0.language.name == "en"}).first else{
                    if let txt = ability.flavor_text_entries.first{
                        text = txt.flavor_text.replace(string: "\n", replacement: " ");
                    }
                    return;
                }
                text = englishFlavor.flavor_text.replace(string: "\n", replacement: " ");
                stackView.addArrangedSubview(AbilityView(title: ability.name.capitalized, text: text, selectedColor: selectedColor))
                if index + 1 < abilities.count{
                    stackView.addArrangedSubview(Separator());
                }
            }
        }
    }
}
