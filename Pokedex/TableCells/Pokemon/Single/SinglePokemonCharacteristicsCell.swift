//
//  SinglePokemonCharacteristicsCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 02/03/23.
//

import UIKit

class SinglePokemonCharacteristicsCell: UITableViewCell {
    static let identifier = "characteristicsId"
    let horizontalChart = HorizontalChartView();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        backgroundColor = .red;
        layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SinglePokemonCharacteristicsCell{
    private func layout(){
        addSubview(horizontalChart);
        
        NSLayoutConstraint.activate([
            horizontalChart.centerYAnchor.constraint(equalTo: centerYAnchor),
            horizontalChart.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
