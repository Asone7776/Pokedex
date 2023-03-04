//
//  Separator.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 04/03/23.
//

import UIKit

class Separator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 1)
    }

}

extension Separator {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray4;
    }
}
