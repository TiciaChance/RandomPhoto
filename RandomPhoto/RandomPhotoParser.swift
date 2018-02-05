//
//  RandomPhotoParser.swift
//  RandomPhoto
//
//  Created by admin-lchance on 2/5/18.
//  Copyright © 2018 admin-lchance. All rights reserved.
//

import Foundation

struct RandomPhoto: Decodable {
    let urls: ImageUrl
}

struct ImageUrl: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
}
