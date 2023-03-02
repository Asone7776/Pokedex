//
//  SinglePokemonCharacteristicsCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 02/03/23.
//

import UIKit

class SinglePokemonCharacteristicsCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SinglePokemonCharacteristicsCell{
    private func layout(){
        
    }
}
