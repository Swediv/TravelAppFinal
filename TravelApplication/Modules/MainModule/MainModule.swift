//
//  MainModule.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 02.10.2022.
//

import UIKit

// MARK: - MainModuleDelegate

protocol MainModuleDelegate: AnyObject {
    
}

class MainModule {
    weak var delegate: MainModuleDelegate?
    private let view: MainViewProtocol
    
    // MARK: - Construction
    
    init() {
        let interactor = MainInteractor()
        let presenter = MainPresenter(interactor: interactor)
        let viewController = MainViewController(presenter: presenter)
        self.view = viewController
        
        presenter.view = view
        presenter.module = self
        presenter.router = self
        
        interactor.delegate = presenter
    }
    
    // MARK: - Base class
    
    func entry() -> UIViewController {
        guard let viewController = view as? UIViewController else {
            fatalError("TemplateTestView is not UIViewController")
        }
        return viewController
    }
    
    // MARK: - Private
    
}

// MARK: - MainRouter

extension MainModule: MainRouterProtocol {
    
}
