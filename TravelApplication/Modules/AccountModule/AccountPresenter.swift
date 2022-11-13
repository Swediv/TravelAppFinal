//
//  AccountPresenter.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 12.11.2022.
//

import Foundation

protocol AccountPresenterProtocol: AnyObject {
    var view: AccountViewProtocol? { get set }
    var router: AccountRouterProtocol? { get set }
    var module: AccountModule? { get set }
    var interactor: AccountInteractorProtocol { get }
    
    func viewDidLoaded()
}

class AccountPresenter: AccountPresenterProtocol {
    weak var view: AccountViewProtocol?
    weak var module: AccountModule?
    weak var router: AccountRouterProtocol?
    
    var interactor: AccountInteractorProtocol
    
    // MARK: - Construction
    
    init(interactor: AccountInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - Base class
    
    func viewDidLoaded() {
        
    }
    
    // MARK: - Private
    
}

// MARK: - AccountPresenter

extension AccountPresenter: AccountInteractorDelegate {
    
}
