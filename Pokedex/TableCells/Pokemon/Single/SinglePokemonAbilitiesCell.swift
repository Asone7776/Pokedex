//
//  SinglePokemonAbilitiesCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 04/03/23.
//

import UIKit
import BetterSegmentedControl

class SinglePokemonAbilitiesCell: UITableViewCell {

    static let identifier = "abilitiesCell";
    
    let label:UILabel = {
        let label = UILabel();
        label.stylePokemonLabel();
        label.text = "Abilities";
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
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
        segments: LabelSegment.segments(withTitles: ["STATS", "EVOLUTUONS", "MOVES"],
                                        normalTextColor: .lightGray,
                                        selectedTextColor: .white),
        options:[.backgroundColor(.clear),
                 .indicatorViewBackgroundColor(UIColor(red: 0.36, green: 0.38, blue: 0.87, alpha: 1.00)),
                 .cornerRadius(3.0),
                 .animationSpringDamping(1.0)])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        contentView.isUserInteractionEnabled = true
        navigationSegmentedControl.translatesAutoresizingMaskIntoConstraints = false;
        navigationSegmentedControl.addTarget(self, action: #selector(navigationSegmentedControlValueChanged(_:)), for: .valueChanged)
        addSubview(navigationSegmentedControl);
        layout();
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SinglePokemonAbilitiesCell{
    private func layout(){
        addSubview(label);
        stackView.addArrangedSubview(AbilityView(title: "Torrents", text: "Powers up Water-type moves when the Pokémon is in trouble."));
        stackView.addArrangedSubview(Separator());
        stackView.addArrangedSubview(AbilityView(title: "Rain dish", text: "The Pokémon gradually regains HP in rain."))
        addSubview(stackView);
        NSLayoutConstraint.activate([
            navigationSegmentedControl.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: navigationSegmentedControl.trailingAnchor, multiplier: 2),
            navigationSegmentedControl.topAnchor.constraint(equalTo: topAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalToSystemSpacingBelow: navigationSegmentedControl.bottomAnchor, multiplier: 2),
            
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

extension SinglePokemonAbilitiesCell{
    // MARK: - Action handlers
      @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
          print(sender);
//          if sender.index == 0 {
//              print("Turning lights on.")
//              if #available(iOS 13.0, *) {
//                  backgroundColor = .systemGray5
//              } else {
//                  backgroundColor = .white
//              }
//          } else {
//              print("Turning lights off.")
//              backgroundColor = .darkGray
//          }
      }
}
