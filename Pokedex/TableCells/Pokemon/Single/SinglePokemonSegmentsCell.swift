//
//  SinglePokemonAbilitiesCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 04/03/23.
//

import UIKit
import BetterSegmentedControl

class SinglePokemonSegmentsCell: UITableViewCell {
    
    static let identifier = "abilitiesCell";
    let pokemonItems = SinglePokemonItems();
    
    let stackView:UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.spacing = 10;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.distribution = .equalSpacing
        return stack;
    }();
    
    let navigationSegmentedControl = BetterSegmentedControl(
        frame: CGRect(x: 0, y: 0, width: UIView.noIntrinsicMetric, height: 30.0),
        segments: LabelSegment.segments(withTitles: ["STATS", "MOVES"],
                                        normalTextColor: UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00),
                                        selectedTextColor: .white),
        options:[.backgroundColor(.clear),
                 .indicatorViewBackgroundColor(UIColor(red: 0.33, green: 0.62, blue: 0.87, alpha: 1.00)),
                 .cornerRadius(15.0),
                 .animationSpringDamping(1.0)
        ])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        backgroundColor = .systemBackground;
        setupSegmentalControl();
        layout();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SinglePokemonSegmentsCell{
    //MARK: Important
    private func setupSegmentalControl(){
        contentView.isUserInteractionEnabled = true
        navigationSegmentedControl.translatesAutoresizingMaskIntoConstraints = false;
        navigationSegmentedControl.addTarget(self, action: #selector(navigationSegmentedControlValueChanged(_:)), for: .valueChanged)
        addSubview(navigationSegmentedControl);
    }
    private func layout(){
        stackView.addArrangedSubview(PokemonCharacteristicsView());
        stackView.addArrangedSubview(AbilitiesView());
        stackView.addArrangedSubview(SpritesView());
        addSubview(stackView);
        addSubview(pokemonItems);
        NSLayoutConstraint.activate([
            navigationSegmentedControl.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: navigationSegmentedControl.trailingAnchor, multiplier: 2),
            navigationSegmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 3),
            
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: navigationSegmentedControl.bottomAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
            pokemonItems.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokemonItems.topAnchor.constraint(equalToSystemSpacingBelow: navigationSegmentedControl.bottomAnchor, multiplier: 2),
            trailingAnchor.constraint(equalTo: pokemonItems.trailingAnchor),
            bottomAnchor.constraint(equalTo: pokemonItems.bottomAnchor)
        ])
    }
}
// MARK: - Action handlers
extension SinglePokemonSegmentsCell{
    @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        if sender.index == 0 {
            stackView.isHidden = false;
            pokemonItems.isHidden = true;
        }
        else {
            stackView.isHidden = true;
            pokemonItems.isHidden = false;
        }
    }
}