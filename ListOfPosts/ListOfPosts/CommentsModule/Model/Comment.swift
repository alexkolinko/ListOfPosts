//
//  Comment.swift
//  ListOfPosts
//
//  Created by Alexandr on 09.04.2021.
//

import Foundation


struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
