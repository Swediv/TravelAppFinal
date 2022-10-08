//
//  NavigationRouter.swift
//  TravelApplication
//
//  Created by Artem Chuklov on 01.10.2022.
//

import UIKit

//public extension UIViewController {
//    var router: NavigationRouter {
//        return NavigationRouter(viewController: self)
//    }
//}
//
//struct NavigationRouter {
//    unowned private let viewController: UIViewController
//    
//    private var navigationController: UINavigationController? {
//        return viewController.navigationController
//    }
//    
//    fileprivate init(viewController: UIViewController) {
//        self.viewController = viewController
//    }
//    
//    func push(animated: Bool = true, _ make: @escaping () -> UIViewController) -> (() -> Void) {
//        return {
//            let newViewController = make()
//            self.navigationController?.pushViewController(newViewController, animated: animated)
//        }
//    }
//    
//    func push<Input>(animated: Bool = true, _ make: @escaping (Input) -> UIViewController) -> ((Input) -> Void) {
//        return { input in
//            let newViewController = make(input)
//            self.navigationController?.pushViewController(newViewController, animated: animated)
//        }
//    }
//}
