//
//  MainInteractor.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 02.10.2022.
//

import Foundation

protocol MainInteractorDelegate: AnyObject {
    func receivedCardModel(_ model: CardModel)
}

protocol MainInteractorProtocol {
    func prepareDataForCard()
}

class MainInteractor: MainInteractorProtocol {
    
    weak var delegate: MainInteractorDelegate?
    
    func prepareDataForCard() {
        let cardData = CardModel(type: "Milleage", value: 3784)
        delegate?.receivedCardModel(cardData)
    }
}
