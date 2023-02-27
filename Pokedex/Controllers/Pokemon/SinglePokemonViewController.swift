//
//  SinglePokemonViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 27/02/23.
//

import UIKit

class SinglePokemonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground;
//        let back = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
//        navigationItem.leftBarButtonItem = back;
        title = "Single"
    }
    @objc func close(){
        navigationController?.popViewController(animated: true)
    }
}
