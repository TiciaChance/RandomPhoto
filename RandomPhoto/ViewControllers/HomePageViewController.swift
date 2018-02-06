//
//  ViewController.swift
//  RandomPhoto
//
//  Created by admin-lchance on 2/5/18.
//  Copyright © 2018 admin-lchance. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var getPhotoButton: UIButton!
    let presentAnimationController = PresentAnimationController(direction: .bottom)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let viewFrame = view.frame
        getPhotoButton.backgroundColor = .black
        getPhotoButton.layer.cornerRadius = 15
        getPhotoButton.setTitleColor(.red, for: .normal)
        getPhotoButton.frame = CGRect(x: viewFrame.width/2 - 50, y: viewFrame.height/2 - 25, width: 100, height: 50)
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
