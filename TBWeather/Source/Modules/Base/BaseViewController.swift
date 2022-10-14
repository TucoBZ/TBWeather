//
//  BaseViewController.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emptyState: EmptyStateView = {
        let view = EmptyStateView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// empty state description, override it if yout want to change the default empty state message
    open var emptyStateDescription: String? { nil }
}
    
// MARK: Loading

extension BaseViewController {
    
    func showLoading() {
        view.addSubview(activityIndicator)
        
        activityIndicator.alpha = 1.0
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        UIView.animate(withDuration: 0.5) {
            self.activityIndicator.alpha = 0
        } completion: { completed in
            if completed {
                self.activityIndicator.removeFromSuperview()
            }
        }
    }
    
}

// MARK: Empty State

extension BaseViewController {
    
    func showEmptyState() {
        view.addSubview(emptyState)
        
        self.emptyState.alpha = 1
        
        NSLayoutConstraint.activate([
            emptyState.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            emptyState.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            emptyState.topAnchor.constraint(equalTo: self.view.topAnchor),
            emptyState.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        emptyState.showEmptyState(message: emptyStateDescription)
    }
    
    func hideEmptyState() {
        self.emptyState.removeFromSuperview()
    }
}


// MARK: EmptyStateViewDelegate

extension BaseViewController: EmptyStateViewDelegate {
    
    /// Override this method if you want to handle the empty state try again
    @objc
    func didTryAgain() {}
}
