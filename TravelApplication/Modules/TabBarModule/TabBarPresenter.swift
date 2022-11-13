//
//  TabBarPresenter.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 04.11.2022.
//

import Foundation

protocol TabBarPresenterProtocol: AnyObject {
    var view: TabBarViewProtocol? { get set }
    var router: TabBarRouterProtocol? { get set }
    var module: TabBarModule? { get set }
    var interactor: TabBarInteractorProtocol { get }
    
    func viewDidLoaded()
}

class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    weak var module: TabBarModule?
    weak var router: TabBarRouterProtocol?
    
    var interactor: TabBarInteractorProtocol
    
    // MARK: - Construction
    
    init(interactor: TabBarInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - Base class
    
    func viewDidLoaded() {
        
    }
    
    // MARK: - Private
    
}

// MARK: - TabBarPresenter

extension TabBarPresenter: TabBarInteractorDelegate {
    
}
