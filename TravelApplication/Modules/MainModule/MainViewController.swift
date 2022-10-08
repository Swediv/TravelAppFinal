//
//  MainViewController.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 02.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    private let presenter: MainPresenterProtocol
    
    private lazy var backgroundView: UIView = _backgroundView
    private lazy var currentMillageLabel = _currentMillageLabel
    private let card  = Card(frame: .zero)
    
    // MARK: - Construction
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Base class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        applyConstraints()
        presenter.viewDidLoaded()
    }
    
    // MARK: - Internal setup
    
    private func setupSubviews() {
        view.backgroundColor = .lightGray
        view.addSubview(backgroundView)
        backgroundView.addSubview(card)
        
    }
    
    private func applyConstraints() {
        card.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            card.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 12),
            card.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            card.widthAnchor.constraint(equalToConstant: 140),
            card.heightAnchor.constraint(equalToConstant: 52)
        ])
    } 
    
    // MARK: - Actions
}

// MARK: - MainViewProtocol

extension MainViewController: MainViewProtocol {
    func setupCard(with model: CardModel) {
        card.setup(with: model)
    }
}

// MARK: - Subviews creation

private extension MainViewController {
    var _backgroundView: UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }
    
    var _currentMillageLabel: UILabel {
        let label = UILabel()
        
        return label
    }
}  
