//
//  UILabel+Utils.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 04/03/23.
//

import UIKit

extension UILabel{
    func stylePokemonLabel(){
        self.textColor = UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00);
        self.font = .systemFont(ofSize: 20)
        self.textAlignment = .center;
    }
}
