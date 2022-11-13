//
//  AccountViewController.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 12.11.2022.
//

import UIKit

class AccountViewController: UIViewController {
    private let presenter: AccountPresenterProtocol
    private lazy var backgroundInfoView: UIView = _backgroundInfoView
    
    // MARK: - Construction
    
    init(presenter: AccountPresenterProtocol) {
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
        view.addSubview(backgroundInfoView)
    }
    
    private func applyConstraints() {
        backgroundInfoView.snp.makeConstraints { snp in
            snp.top.leading.trailing.equalToSuperview()
            snp.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
    } 
    
    // MARK: - Actions
}

// MARK: - AccountViewProtocol

extension AccountViewController: AccountViewProtocol {
    
}

// MARK: - Subviews creation

private extension AccountViewController {
    var _backgroundInfoView: UIView {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.cornerRadius = Grid.pt20
        
        return view
    }
}  
