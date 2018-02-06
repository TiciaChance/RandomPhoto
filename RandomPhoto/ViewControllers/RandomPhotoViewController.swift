//
//  RandomPhotoDisplayVC.swift
//  RandomPhoto
//
//  Created by admin-lchance on 2/5/18.
//  Copyright © 2018 admin-lchance. All rights reserved.
//

import UIKit

class RandomPhotoViewController: UIViewController {
    
    let unsplashAPI = UnsplashPhotoAPI()
    
    @IBOutlet weak var randomPhotoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        randomPhotoImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(randomPhotoImageView)
        fetchData()
    }

    func fetchData() {
        unsplashAPI.getRandomPhoto() { (response) in
            switch response {
            case .success(let responseData):
                let urlString = responseData.result.urls.regular
                guard let url = URL(string: urlString) else { return }
                guard let data = try? Data(contentsOf: url) else { return }
           
                
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async(execute: {
                    self.randomPhotoImageView.image = image
                })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
