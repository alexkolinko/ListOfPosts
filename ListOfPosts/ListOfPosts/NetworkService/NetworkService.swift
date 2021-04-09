//
//  NetworkService.swift
//  ListOfPosts
//
//  Created by Alexandr on 08.04.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPosts(completetion: @escaping (Result<[Post]?, Error>) -> Void)
    func getComments(completetion: @escaping (Result<[Comment]?, Error>) -> Void)
    
}

class NetworkService: NetworkServiceProtocol {
    
   
    
    func getPosts(completetion: @escaping (Result<[Post]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts?userId=1"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completetion(.failure(error))
            }
            do {
                let obj = try JSONDecoder().decode([Post].self, from: data!)
                completetion(.success(obj))
            } catch {
                completetion(.failure(error))
            }
        }.resume()
        
    }
    
    func getComments(completetion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completetion(.failure(error))
            }
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                completetion(.success(obj))
            } catch {
                completetion(.failure(error))
            }
        }.resume()
    }
    
    
}
