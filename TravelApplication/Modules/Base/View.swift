//
//  View.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 01.10.2022.
//

import Foundation

protocol View: AnyObject {
    associatedtype Presenter
    
    var presenter: Presenter? { get set }
}
