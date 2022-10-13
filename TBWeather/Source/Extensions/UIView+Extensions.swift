//
//  UIView+Extensions.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit

extension UIView {
    func showViewAnimated() {
        self.transform = CGAffineTransform(translationX: 0.0, y: 30)
        self.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .curveEaseOut) {
            self.alpha = 1
            self.transform = .identity
        }
    }
}
