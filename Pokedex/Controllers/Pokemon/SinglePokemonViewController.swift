//
//  SinglePokemonViewController.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 27/02/23.
//

import UIKit

class SinglePokemonViewController: UIViewController {
    let initialTopEdge: CGFloat = 180;
    let modifiedTopEdge: CGFloat = 50;
    var topTableConstrain:NSLayoutConstraint?;

    let bottomLayer:UIView = {
        let view = UIView();
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 48
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    lazy var table:UITableView = {
        let table = UITableView(frame: .zero, style: .grouped);
        table.translatesAutoresizingMaskIntoConstraints = false;
        table.delegate = self;
        table.dataSource = self;
        table.clipsToBounds = true;
        table.layer.cornerRadius = 48
        table.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        table.translatesAutoresizingMaskIntoConstraints = false;
        table.backgroundColor = .clear;
        table.separatorStyle = .none;
        table.showsVerticalScrollIndicator = false;
        table.allowsSelection = false;
        return table;
    }();
    lazy var backButton:UIButton = {
        let button = UIButton(type: .system);
        let img = UIImage(systemName:"chevron.down",withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        button.tintColor = .systemBackground
        button.setImage(img, for: .normal);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside);
        return button;
    }();
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00);
        layout();
        registerCustomCells();
    }
    @objc func close(){
        navigationController?.popViewController(animated: true)
    }
}
extension SinglePokemonViewController{
    func layout(){
        view.addSubview(bottomLayer);
        view.addSubview(backButton);
        view.addSubview(table)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            backButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            
            bottomLayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomLayer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: modifiedTopEdge),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        topTableConstrain = bottomLayer.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: initialTopEdge);
        topTableConstrain?.isActive = true;
    }
    func registerCustomCells(){
        table.register(SingleCommonInformationPokemonCell.self, forCellReuseIdentifier: SingleCommonInformationPokemonCell.identifier);
    }
}
//MARK: Actions
extension SinglePokemonViewController{
    @objc func backAction(){
        dismiss(animated: true);
    }
}
//MARK: Table Data source
extension SinglePokemonViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row;
        if index == 0{
            return SingleCommonInformationPokemonCell(style: .default, reuseIdentifier: SingleCommonInformationPokemonCell.identifier);
        }else{
            let cell = UITableViewCell();
            cell.backgroundColor = .clear
            var configuration = cell.defaultContentConfiguration();
            configuration.text = "test - \(indexPath.row)";
            cell.contentConfiguration = configuration;
            return cell;
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SinglePokemonHeader();
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200;
    }
}


//MARK: Animate bottom view
extension SinglePokemonViewController:UITableViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.topTableConstrain?.constant = max(self.initialTopEdge - scrollView.contentOffset.y, self.modifiedTopEdge)
        self.view.layoutIfNeeded();
    }
}
