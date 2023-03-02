//
//  HorizontalChartView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 02/03/23.
//

import UIKit
import Charts

class HorizontalChartView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension HorizontalChartView {
    func style() {
//        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
    }
}
