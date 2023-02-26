//
//  TypeView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 26/02/23.
//

import UIKit

class TypeView: UIView {
    
    let image: UIImageView = {
        let view = UIImageView();
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.contentMode = .scaleAspectFit;
        return view;
    }();
    
    init(typeName:String) {
        super.init(frame: .zero)
        image.image = UIImage(named: typeName);
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: 30)
    }
}

extension TypeView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(image);
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.topAnchor.constraint(equalTo: topAnchor),
            trailingAnchor.constraint(equalTo: image.trailingAnchor),
            bottomAnchor.constraint(equalTo: image.bottomAnchor)
        ]);
    }
    func configureImage(imageName: String){
        
    }
}
