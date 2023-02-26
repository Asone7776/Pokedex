//
//  ViewController+utils.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import UIKit

extension UIViewController{
    func setTabBarImage(imageName:String,title:String,tag:Int){
        let image = UIImage(named:imageName);
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag);
    }
    func setupAppearance(){
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        navigationController?.navigationBar.isTranslucent = false;
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        addGradientLines();
    }
    func addGradientLines() {
        let viewWithGradient = GradientView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 4));
        view.addSubview(viewWithGradient);
        NSLayoutConstraint.activate([
            viewWithGradient.topAnchor.constraint(equalTo: view.topAnchor),
            viewWithGradient.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            viewWithGradient.trailingAnchor.constraint(equalTo:view.trailingAnchor),
        ]);
    }
}
