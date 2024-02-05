//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Margarita Slesareva on 04.02.2024.
//

import UIKit

private enum Metrics {
    static let verticalSpacing: CGFloat = 14
}

class ViewController: UIViewController {
    
    private let firstButton = CustomButton()
    private let secondButton = CustomButton()
    private let thirdButton = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        addViews()
        addConstraints()
        configureViews()
    }
    
    private func addViews() {
        [firstButton, secondButton, thirdButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, 
                constant: Metrics.verticalSpacing
            ),
            
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(
                equalTo: firstButton.bottomAnchor,
                constant: Metrics.verticalSpacing
            ),

            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(
                equalTo: secondButton.bottomAnchor,
                constant: Metrics.verticalSpacing
            ),
        ])
    }
    
    private func configureViews() {
        view.backgroundColor = .systemBackground

        firstButton.setTitle("First Button", for: .normal)
        secondButton.setTitle("Second Medium Button", for: .normal)
        thirdButton.setTitle("Third", for: .normal)
        
        
        thirdButton.addTarget(self, action: #selector(thirdButtonTapped), for: .touchUpInside)
    }
    
    @objc private func thirdButtonTapped() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        
        present(viewController, animated: true)
    }
}
