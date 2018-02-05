//
//  ViewController.swift
//  RandomPhoto
//
//  Created by admin-lchance on 2/5/18.
//  Copyright © 2018 admin-lchance. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let unsplashAPI = UnsplashPhotoAPI()
    //otherwise will be using Unsplash before it's actually instantiated
    let presentAnimationController = PresentAnimationController(direction: .left)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let toVC = segue.destination as UIViewController
            toVC.transitioningDelegate = self
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimationController
    }
}

