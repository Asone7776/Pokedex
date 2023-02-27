//
//  MoveTableCell.swift
//  Pokedex
//
//  Created by Arthur Obichkin on 28/02/23.
//

import UIKit

class MoveTableCell: UITableViewCell {
    static let identifier = "MoveCell";
    static let rowHeight: CGFloat = 75;
    
    lazy var nameLabel: UILabel = {
        let label = UILabel();
        label.text = "Test"
        label.font = .boldSystemFont(ofSize: 15);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let stackView:UIStackView = {
        let stack = UIStackView();
        stack.axis = .horizontal;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.spacing = 10;
        return stack;
    }();
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MoveTableCell{
    func layout(){
        addSubview(nameLabel);
        addSubview(stackView);
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]);
    }
    func configureCell(moveModel:Move){
        stackView.removeAllArrangedSubviews();
        nameLabel.text = moveModel.capitalizedName;
        if let type = moveModel.type{
            stackView.addArrangedSubview(TypeView(typeName: type.name));
        }
    }
}
