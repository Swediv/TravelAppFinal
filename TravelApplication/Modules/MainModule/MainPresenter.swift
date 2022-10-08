//
//  MainPresenter.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 02.10.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    var module: MainModule? { get set }
    var interactor: MainInteractorProtocol { get }
    
    func viewDidLoaded()
}

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    weak var module: MainModule?
    weak var router: MainRouterProtocol?
    
    var interactor: MainInteractorProtocol
    
    // MARK: - Construction
    
    init(interactor: MainInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - Base class
    
    func viewDidLoaded() {
        interactor.prepareDataForCard()
    }
    
    // MARK: - Private
    
}

// MARK: - MainPresenter

extension MainPresenter: MainInteractorDelegate {
    func receivedCardModel(_ model: CardModel) {
        view?.setupCard(with: model)
    }
}
