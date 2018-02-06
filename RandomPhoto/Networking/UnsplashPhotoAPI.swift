//
//  UnsplashPhotoAPI.swift
//  RandomPhoto
//
//  Created by admin-lchance on 2/5/18.
//  Copyright © 2018 admin-lchance. All rights reserved.
//

import UIKit

typealias UnsplashCompletion = (RandomPhotoResponse) -> Void

enum RandomPhotoResponse {
    case success(response: RandomPhotoResponseData)
    case failure(error: Error)
}

struct RandomPhotoResponseData {
    let result: RandomPhoto
}

class UnsplashPhotoAPI: NSObject {
    
    let baseURLString = "https://api.unsplash.com/photos/random/"
    let appID = "0d83d53b3015942e7c7e14a84a4bd5ee4631b62935bb4612da3bc229356772f2"
    
    func getRandomPhoto(completion: @escaping UnsplashCompletion) {
        
        guard let url = URL(string: "\(baseURLString)?client_id=\(appID)") else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let defaultConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: defaultConfig)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print(error)
                completion(.failure(error: error))
            } else if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let imageURL = try jsonDecoder.decode(RandomPhoto.self, from: data)
                    completion(.success(response: RandomPhotoResponseData(result: imageURL)))
                } catch {
                    completion(.failure(error: error))
                    return
                }
            }
        }
        task.resume()
    }
}
