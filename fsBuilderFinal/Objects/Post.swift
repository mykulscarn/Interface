//
//  Post.swift
//  fsBuilderFinal
//
//  Created by Tod Brown on 4/22/19.
//  Copyright © 2019 Tod Brown. All rights reserved.
//

import UIKit

class Post: NSObject {
    
    var author: String!
    var likes: Int!
    var pathToImage: String!
    var userID: String!
    var postID: String!
    
    var peopleWhoLike: [String] = [String]()
}
