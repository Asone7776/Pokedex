//
//  Enums.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 12/03/23.
//

import UIKit

enum ElementsColor: String {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case unknown
    case shadow
    
    
    var create: UIColor {
        switch self {
        case .normal:
            return UIColor(red: 0.60, green: 0.62, blue: 0.63, alpha: 1.00)
        case .fighting:
            return UIColor(red: 0.85, green: 0.26, blue: 0.34, alpha: 1.00)
        case .flying:
            return UIColor(red: 0.61, green: 0.71, blue: 0.91, alpha: 1.00)
        case .poison:
            return UIColor(red: 0.71, green: 0.39, blue: 0.81, alpha: 1.00)
        case .ground:
            return UIColor(red: 0.84, green: 0.52, blue: 0.33, alpha: 1.00)
        case .rock:
            return UIColor(red: 0.81, green: 0.76, blue: 0.55, alpha: 1.00)
        case .bug:
            return UIColor(red: 0.62, green: 0.76, blue: 0.19, alpha: 1.00)
        case .ghost:
            return UIColor(red: 0.41, green: 0.44, blue: 0.77, alpha: 1.00)
        case .steel:
            return UIColor(red: 0.33, green: 0.59, blue: 0.64, alpha: 1.00)
        case .fire:
            return UIColor(red: 0.97, green: 0.65, blue: 0.31, alpha: 1.00)
        case .water:
            return UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00)
        case .grass:
            return UIColor(red: 0.36, green: 0.75, blue: 0.38, alpha: 1.00)
        case .electric:
            return UIColor(red: 0.93, green: 0.84, blue: 0.25, alpha: 1.00)
        case .psychic:
            return UIColor(red: 0.97, green: 0.49, blue: 0.48, alpha: 1.00)
        case .ice:
            return UIColor(red: 0.49, green: 0.83, blue: 0.79, alpha: 1.00)
        case .dragon:
            return UIColor(red: 0.03, green: 0.45, blue: 0.78, alpha: 1.00)
        case .dark:
            return UIColor(red: 0.37, green: 0.38, blue: 0.43, alpha: 1.00)
        case .fairy:
            return UIColor(red: 0.94, green: 0.59, blue: 0.90, alpha: 1.00)
        case .unknown:
            return ElementsColor(rawValue: "normal")!.create
        case .shadow:
            return ElementsColor(rawValue: "normal")!.create
        }
    }
}
