//
//  UITableCell+Utils.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 28/02/23.
//

import UIKit

extension UITableViewCell{
    func animateBackground(){
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00);
        self.selectedBackgroundView = backgroundView;
    }
}
