//
//  AccountInteractor.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 12.11.2022.
//

import Foundation

protocol AccountInteractorDelegate: AnyObject {
    
}

protocol AccountInteractorProtocol {
    
}

class AccountInteractor: AccountInteractorProtocol {
    
    weak var delegate: AccountInteractorDelegate?
}
