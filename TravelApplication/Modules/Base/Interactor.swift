//
//  Interactor.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 01.10.2022.
//

import Foundation

protocol Interactor: AnyObject {
    associatedtype Delegate
    
    var delegate: Delegate? { get set }
}
