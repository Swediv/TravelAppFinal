//
//  AccountModule.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 12.11.2022.
//

import UIKit

// MARK: - AccountModuleDelegate

protocol AccountModuleDelegate: AnyObject {
    
}

class AccountModule {
    weak var delegate: AccountModuleDelegate?
    private let view: AccountViewProtocol
    
    // MARK: - Construction
    
    init() {
        let interactor = AccountInteractor()
        let presenter = AccountPresenter(interactor: interactor)
        let viewController = AccountViewController(presenter: presenter)
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

// MARK: - AccountRouter

extension AccountModule: AccountRouterProtocol {
    
}
