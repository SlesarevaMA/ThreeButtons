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
    
    static let backgroundColor: UIColor = .systemBlue
    static let tintColor: UIColor = .white
}

final class CustomButton: UIButton {
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        
    }
    
    private var touchDownAnimator: UIViewPropertyAnimator?
    private var touchUpAnimator: UIViewPropertyAnimator?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration = .plain()
        configuration?.contentInsets = Metrics.contentInsets
        configuration?.imagePlacement = .trailing
        configuration?.imagePadding = Metrics.imagePadding
        setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        tintColor = Metrics.tintColor
        
        backgroundColor = Metrics.backgroundColor
        layer.cornerRadius = Metrics.cornerRadius
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        
        touchDownAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut)
        touchUpAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    @objc func touchDown() {
        touchUpAnimator?.stopAnimation(true)
        touchUpAnimator?.finishAnimation(at: .current)
        
        touchDownAnimator?.addAnimations {
            self.transform = CGAffineTransformMakeScale(0.9, 0.9)
        }
        
        touchDownAnimator?.startAnimation()
    }
    
    @objc func touchUp() {
        touchDownAnimator?.stopAnimation(true)
        touchDownAnimator?.finishAnimation(at: .current)
        
        touchUpAnimator?.addAnimations {
            self.transform = .identity
        }
        
        touchUpAnimator?.startAnimation()
    }
}
