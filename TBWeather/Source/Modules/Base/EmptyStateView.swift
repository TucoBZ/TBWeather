//
//  EmptyStateView.swift
//  TBWeather
//
//  Created by Túlio Bazan da Silva on 12/10/22.
//  Copyright © 2022 TBZN. All rights reserved.
//

import UIKit
import WeatherCore

protocol EmptyStateViewDelegate: AnyObject {
    func didTryAgain()
}

final class EmptyStateView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 24.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var emptyStateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTryAgain), for: .touchUpInside)
        button.setTitle(EmptyStateLoaclization.tryAgain.localized, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    enum EmptyStateLoaclization: Localizable {
        case tryAgain
        case defaultDescription
    }
    
    weak var delegate: EmptyStateViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showEmptyState(message: String?) {
        if let message = message {
            emptyStateLabel.text = message
        } else {
            emptyStateLabel.text = EmptyStateLoaclization.defaultDescription.localized
        }

        stackView.showViewAnimated()
    }
    
    @objc
    func didTryAgain() {
        delegate?.didTryAgain()
    }
    
}

extension EmptyStateView: ViewCodable {
    func setupHierarchy() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(emptyStateLabel)
        stackView.addArrangedSubview(tryAgainButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tryAgainButton.heightAnchor.constraint(equalToConstant: 64),
        ])
    }
    
    func additionalSetup() {
        backgroundColor = .systemBackground
    }
}
