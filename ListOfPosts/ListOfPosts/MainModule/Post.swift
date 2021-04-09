//
//  Post.swift
//  ListOfPosts
//
//  Created by Alexandr on 08.04.2021.
//

import Foundation


struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
