//
//  Alerts.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 27/02/23.
//

import UIKit

struct Alerts {
    func showErrorAlert(title: String? = "Error",message: String,completion:@escaping (UIAlertController) -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "OK", style: .cancel);
        alert.addAction(action);
        completion(alert);
    }
}
