//
//  TabBarViewController.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 04.11.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    private let presenter: TabBarPresenterProtocol
    
    private let buttonSize = Grid.pt60
    private lazy var userButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(userButtonPressed), for: .touchUpInside)
        button.layer.borderWidth = Grid.pt4
        button.layer.cornerRadius = buttonSize / 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        
        return button
    }()
    
    // MARK: - Construction
    
//    override var tabBar: UITabBar {
//        return CustomTabBar()
//    }
    
    init(presenter: TabBarPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Base class
    
    override func viewDidLoad() {
        self.viewControllers = [AccountModule().entry()]
        super.viewDidLoad()
        setupSubviews()
        applyConstraints()
        presenter.viewDidLoaded()
    }
    
    // MARK: - Internal setup
    
    private func setupSubviews() {
        tabBar.tintColor = .green
        tabBar.alpha = 1
        view.addSubview(userButton)
    }
    
    private func applyConstraints() {
        userButton.snp.makeConstraints { snp in
            snp.width.height.equalTo(buttonSize)
            snp.centerY.equalTo(tabBar.snp.top)
            snp.centerX.equalToSuperview()
        }
    } 
    
    // MARK: - Actions
    
    @objc private func userButtonPressed() {
        
    }
}

// MARK: - TabBarViewProtocol

extension TabBarViewController: TabBarViewProtocol {
    
}

// MARK: - Subviews creation

private extension TabBarViewController {
    
}  
