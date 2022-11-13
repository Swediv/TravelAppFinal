//
//  TabBarModule.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 04.11.2022.
//

import UIKit

// MARK: - TabBarModuleDelegate

protocol TabBarModuleDelegate: AnyObject {
    
}

class TabBarModule {
    weak var delegate: TabBarModuleDelegate?
    private let view: TabBarViewProtocol
    
    // MARK: - Construction
    
    init() {
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter(interactor: interactor)
        let viewController = TabBarViewController(presenter: presenter)
        self.view = viewController
        
        presenter.view = view
        presenter.module = self
        presenter.router = self
        
        interactor.delegate = presenter
    }
    
    // MARK: - Base class
    
    func entry() -> UIViewController {
        guard let viewController = view as? UITabBarController else {
            fatalError("TemplateTestView is not UIViewController")
        }
        return viewController
    }
    
    // MARK: - Private
    
}

// MARK: - TabBarRouter

extension TabBarModule: TabBarRouterProtocol {
    
}
