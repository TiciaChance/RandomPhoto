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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        test()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func test() {
        unsplashAPI.getRandomPhoto() { (response) in
            switch response {
            case .success(let responseData):
                
                //use responsedata to get specific url
                
                let image = responseData.result.urls.raw
                guard let url = URL(string: image) else { return }
                //handle data for image in API call
                let data = try! Data(contentsOf: url)
                let test = UIImage(data: data)
                DispatchQueue.main.async(execute: {
                    let test2 = UIImageView(image: test)
                    test2.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                    self.view.addSubview(test2)
                })
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
