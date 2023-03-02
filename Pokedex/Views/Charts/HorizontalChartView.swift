//
//  HorizontalChartView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 02/03/23.
//

import UIKit
import Charts

class HorizontalChartView: UIView {
    let label = UILabel();
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    override var intrinsicContentSize: CGSize{
//        CGSize(width: 100, height: 100)
//    }
 
}

extension HorizontalChartView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
    }
    
    func layout() {
        
        label.text = "Test label";
        label.translatesAutoresizingMaskIntoConstraints = false;
        addSubview(label);
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
