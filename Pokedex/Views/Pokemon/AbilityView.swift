//
//  AbilityView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 04/03/23.
//

import UIKit

class AbilityView: UIView {
    let label: UILabel = {
        let label = UILabel();
        label.stylePokemonLabel();
        label.font = .systemFont(ofSize: 16);
        label.textAlignment = .left;
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let textView:UILabel = {
        let text = UILabel();
        text.translatesAutoresizingMaskIntoConstraints = false;
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        text.font = UIFont(name: "Avenir", size: 15);
        return text;
    }();
    
    init(title:String,text:String) {
        super.init(frame: .zero);
        label.text = title;
        textView.text = text;
        layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AbilityView{
    private func layout(){
        addSubview(label);
        addSubview(textView);
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 24),
            
            textView.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: textView.bottomAnchor, multiplier: 1)
        ]);
    }
}
