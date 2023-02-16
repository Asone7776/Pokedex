//
//  ViewController+utils.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import UIKit

extension UIViewController{
    func setTabBarImage(imageName:String,title:String,tag:Int){
        let configuration = UIImage.SymbolConfiguration(scale: .large);
        let image = UIImage(systemName: imageName,withConfiguration: configuration);
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag);
    }
}
