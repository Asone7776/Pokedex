//
//  ViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 17/02/23.
//

import UIKit

class MainContainerController: UITabBarController {

    var gradientlayer = CAGradientLayer()
    var upperLayer = CALayer();
    let pokemonController = PokemonViewController();
    let movesController = DummyController2();
    let itemsController = DummyController3();
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: pokemonController);
        let vc2 = UINavigationController(rootViewController: movesController);
        let vc3 = UINavigationController(rootViewController: itemsController);
        vc1.navigationBar.prefersLargeTitles = true;
        vc2.navigationBar.prefersLargeTitles = true;
        vc3.navigationBar.prefersLargeTitles = true;
        vc1.setTabBarImage(imageName: "pokemon", title: "Pokemon", tag: 0);
        vc2.setTabBarImage(imageName: "moves", title: "Moves", tag: 1);
        vc3.setTabBarImage(imageName: "items", title: "Items", tag: 2);
        viewControllers = [vc1,vc2,vc3];
        setupTabBar();
        setGradientBackground();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        let appearance = UITabBarAppearance();
        appearance.shadowColor = .clear
        tabBar.standardAppearance = appearance;
        tabBar.scrollEdgeAppearance = appearance
        pokemonController.setupAppearance();
        movesController.setupAppearance();
        itemsController.setupAppearance();
    }
    
    private func setupTabBar() {
        let gradient = GradientView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 4));
        tabBar.addSubview(gradient);
        tabBar.tintColor = .label;
        tabBar.isTranslucent = false;
    }
}

//MARK: Set Gradient
extension MainContainerController{
    private func setGradientBackground()  {
        gradientlayer.frame = view.bounds
        gradientlayer.colors = [Constants.BrandColors.firstGradientColor.cgColor,Constants.BrandColors.secondGradientColor.cgColor,Constants.BrandColors.thirdGradientColor.cgColor,Constants.BrandColors.fourthGradientColor.cgColor];
        gradientlayer.locations = [0, 0.25, 0.5, 1.0]
        gradientlayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientlayer.endPoint = CGPoint(x: 1, y: 0.5)
        upperLayer.frame = view.bounds
        upperLayer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.3).cgColor;
        view.layer.insertSublayer(gradientlayer, at: 0);
        view.layer.insertSublayer(upperLayer, at: 1);
    }
}

class DummyController2:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .green;
        title = "Moves";
    }
}


class DummyController3:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .orange;
        title = "Items";
    }
}
