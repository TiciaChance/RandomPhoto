//
//  CustomPresentAnimationController.swift
//  RandomPhoto
//
//  Created by admin-lchance on 2/5/18.
//  Copyright © 2018 admin-lchance. All rights reserved.
//

import Foundation
import UIKit

enum PresentingDirection {
    case top, right, left, bottom
    
    var bounds: CGRect {
        return UIScreen.main.bounds
    }
    
    func offSetWithFrame(viewFrame: CGRect) -> CGRect {
        switch self {
        case .top:
            return viewFrame.offsetBy(dx: 0, dy: -bounds.size.height)
        case .bottom:
            return viewFrame.offsetBy(dx: 0, dy: bounds.size.height)
        case .left:
            return viewFrame.offsetBy(dx: -bounds.size.width, dy: 0)
        case .right:
            return viewFrame.offsetBy(dx: bounds.size.width, dy: 0)
        }
    }
}
class PresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var presentingDirection: PresentingDirection
    
    init(direction: PresentingDirection){
        self.presentingDirection = direction
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        let finalFrameForVC = transitionContext.finalFrame(for: toVC)
        let containerView = transitionContext.containerView
        
        toVC.view.frame = presentingDirection.offSetWithFrame(viewFrame: finalFrameForVC)
        containerView.addSubview(toVC.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            fromVC.view.alpha = 0.5
            toVC.view.frame = finalFrameForVC
        }) { (finished) in
            transitionContext.completeTransition(true)
            fromVC.view.alpha = 1.0
        }
        
    }
    
}
