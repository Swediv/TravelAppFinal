//
//  Presenter.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 01.10.2022.
//

import Foundation

class Presenter<V: View, I: Interactor> {
    
    weak var view: V?
    
    let interactor: I
    
    init(view: V, interactor: I) {
        self.view = view
        self.interactor = interactor
        
        if let presenter = self as? V.Presenter, let delegate = self as? I.Delegate {
            view.presenter = presenter
            interactor.delegate = delegate
        }
    }
}
