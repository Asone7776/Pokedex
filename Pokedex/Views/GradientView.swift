//
//  GradientView.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 26/02/23.
//

import UIKit

class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        let gradientView = CAGradientLayer();
        gradientView.frame = bounds;
        gradientView.colors = [Constants.BrandColors.firstGradientColor.cgColor,Constants.BrandColors.secondGradientColor.cgColor,Constants.BrandColors.thirdGradientColor.cgColor,Constants.BrandColors.fourthGradientColor.cgColor];
        gradientView.locations = [0, 0.25, 0.5, 1.0]
        gradientView.startPoint = CGPoint(x: 0, y: 0.5)
        gradientView.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(gradientView);
    }
}
