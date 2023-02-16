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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: DummyController1());
        let vc2 = UINavigationController(rootViewController: DummyController2());
        let vc3 = UINavigationController(rootViewController: DummyController3());
        vc1.setTabBarImage(imageName: "folder", title: "Pokemon", tag: 0);
        vc2.setTabBarImage(imageName: "folder", title: "Moves", tag: 1);
        vc3.setTabBarImage(imageName: "folder", title: "Items", tag: 2);
        viewControllers = [vc1,vc2,vc3];
        setupTabBar();
        setGradientBackground();
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { _ in
            self.gradientlayer.frame = self.view.bounds;
            self.upperLayer.frame = self.view.bounds;
        }
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .black;
        tabBar.isTranslucent = false
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
        upperLayer.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.5).cgColor;
        view.layer.insertSublayer(gradientlayer, at: 0);
        view.layer.insertSublayer(upperLayer, at: 1);
    }
}


class DummyController1:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .white;
        title = "Pokemon";
        navigationController?.navigationBar.isTranslucent = false;
//                navigationController?.navigationBar.prefersLargeTitles = true;
    }
}


class DummyController2:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .green;
        title = "Moves";
        navigationController?.navigationBar.isTranslucent = false;
    }
}


class DummyController3:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .orange;
        title = "Items";
        navigationController?.navigationBar.isTranslucent = false;
    }
}
