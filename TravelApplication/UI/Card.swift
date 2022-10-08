//
//  Card.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 02.10.2022.
//

import UIKit

class Card: UIControl {
    
    // MARK: - Private properties
    
    private let cardTypeLabel = UILabel()
    private let valueLabel = UILabel()
    
    // MARK: - Construction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 12
        backgroundColor = .white
        
        setupSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupShadow()
    }
    
    // MARK: - Private functions
    
    private func setupShadow() {
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 300, height: 4)
    }
    
    private func setupSubviews() {
        addSubview(cardTypeLabel)
        cardTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        cardTypeLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        cardTypeLabel.numberOfLines = 1
        cardTypeLabel.textColor = .black
        cardTypeLabel.textAlignment = .center
        
        addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = .systemFont(ofSize: 16, weight: .regular)
        valueLabel.numberOfLines = 1
        valueLabel.textColor = .darkGray
        valueLabel.textAlignment = .center
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            cardTypeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            cardTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.topAnchor.constraint(greaterThanOrEqualTo: cardTypeLabel.bottomAnchor, constant: 4)
        ])
    }
    
    // MARK: - Functions
    
    func setup(with model: CardModel) {
        cardTypeLabel.text = model.type
        valueLabel.text = "\(model.value) km"
    }
    
}
