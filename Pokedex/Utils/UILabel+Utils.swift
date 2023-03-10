//
//  UILabel+Utils.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 04/03/23.
//

import UIKit

extension UILabel{
    func stylePokemonLabel(color:UIColor? = UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00)){
        self.textColor = color;
        self.font = UIFont(name: "Avenir", size: 20);
        self.textAlignment = .center;
    }
}
