//
//  SinglePokemonCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 01/03/23.
//

import UIKit
import SDWebImage

class SingleCommonInformationPokemonCell: UITableViewCell {
    static let identifier = "topSinglePokemonCell";
    let stackView: UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.spacing = 5;
        stack.alignment = .center
        return stack;
    }();
    
    let typesStack:UIStackView = {
        let stack = UIStackView();
        stack.axis = .horizontal;
        return stack;
    }();
    
    let label:UILabel = {
        let view = UILabel();
        view.font = UIFont(name: "Avenir", size: 40);
        view.textAlignment = .center;
        view.textColor = .label;
        return view;
    }();
    
    let type: UIImageView = {
        let imageView = UIImageView();
        imageView.contentMode = .scaleAspectFit;
        return imageView;
    }();
    
    let text:UITextView = {
        let textView = UITextView();
        textView.text = "Squirtle’s shell is not merely used for protection.The shell’s rounded shape and the grooves on its surface help minimize resistance in water, enabling this pokemon to swim at high speed.";
        textView.font = UIFont(name: "Avenir", size: 15);
        textView.textAlignment = .center;
        textView.isEditable = false;
        textView.isScrollEnabled = false;
        return textView;
    }();
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?,title:String?,types: [Types]?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        configure(title: title,types: types);
        backgroundColor = .systemBackground;
        layout();
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SingleCommonInformationPokemonCell {
    func layout() {
 
        stackView.addArrangedSubview(label);
        stackView.addArrangedSubview(typesStack);
        stackView.addArrangedSubview(text);
        addSubview(stackView);
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]);
    }
    func configure(title:String?,types:[Types]?){
        if let title = title{
            label.text = title;
        }
        if let types = types {
            types.forEach { type in
                typesStack.addArrangedSubview(TypeView(typeName: "\(type.type.name)-type"));
            }
        }
    }
}
