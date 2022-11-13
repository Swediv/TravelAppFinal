//
//  TabBarInteractor.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 04.11.2022.
//

import Foundation

protocol TabBarInteractorDelegate: AnyObject {
    
}

protocol TabBarInteractorProtocol {
    
}

class TabBarInteractor: TabBarInteractorProtocol {
    
    weak var delegate: TabBarInteractorDelegate?
}
