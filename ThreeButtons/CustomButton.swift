//
//  CustomButton.swift
//  ThreeButtons
//
//  Created by Margarita Slesareva on 04.02.2024.
//

import UIKit

private enum Metrics {
    static let contentInsets: NSDirectionalEdgeInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
    static let cornerRadius: CGFloat = 10
    static let imagePadding: CGFloat = 8
    
    static let normalBackgroundColor: UIColor = .systemBlue
    static let dimmedBackgroundColor: UIColor = .systemGray2

    static let dimmedTitleColor: UIColor = .systemGray3
}

final class CustomButton: UIButton {
        
    private let touchDownAnimator: UIViewPropertyAnimator
    private let touchUpAnimator: UIViewPropertyAnimator
    
    override init(frame: CGRect) {
        touchDownAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut)
        touchUpAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut)
        
        super.init(frame: frame)

        configuration = .filled()
        configuration?.contentInsets = Metrics.contentInsets
        configuration?.imagePlacement = .trailing
        configuration?.imagePadding = Metrics.imagePadding
        configuration?.image = UIImage(systemName: "arrow.forward.circle.fill")

        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        if tintAdjustmentMode == .dimmed {
            configuration?.background.backgroundColor = Metrics.dimmedBackgroundColor
            titleLabel?.textColor = Metrics.dimmedTitleColor
            imageView?.tintColor = Metrics.dimmedTitleColor
        } else {
            configuration?.background.backgroundColor = Metrics.normalBackgroundColor
        }
    }
        
    @objc func touchDown() {
        touchUpAnimator.stopAnimation(true)
        touchUpAnimator.finishAnimation(at: .current)
        
        touchDownAnimator.addAnimations {
            self.transform = CGAffineTransformMakeScale(0.9, 0.9)
        }
        
        touchDownAnimator.startAnimation()
    }
    
    @objc func touchUp() {
        touchDownAnimator.stopAnimation(true)
        touchDownAnimator.finishAnimation(at: .current)
        
        touchUpAnimator.addAnimations {
            self.transform = .identity
        }
        
        touchUpAnimator.startAnimation()
    }
}
