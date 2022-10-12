//
//  Router.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

protocol Router {
    var source: UIViewController? { get }
    var factory: AppFactoryProtocol { get }
}

extension Router {

    func push(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.source?.navigationController?.pushViewController(viewController, animated: animated)
        }
    }

    func present(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.source?.present(viewController, animated: animated, completion: nil)
        }
    }

    func setRoot(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.source?.navigationController?.setViewControllers([viewController], animated: animated)
        }
    }

    func setWindowRoot(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            guard let window = source?.view.window else { return }
            window.set(rootViewController: viewController, animated: animated)
        }
    }
}

extension UIWindow {
    
    func set(rootViewController viewController: UIViewController, animated: Bool = true) {
        guard animated else {
            self.rootViewController = viewController
            self.makeKeyAndVisible()
            return
        }
        
        self.rootViewController = viewController
        self.makeKeyAndVisible()
        UIView.transition(with: self,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
