//
//  MainPresenter.swift
//  ListOfPosts
//
//  Created by Alexandr on 08.04.2021.
//

import Foundation

protocol MainViewProtocol: class {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getPosts()
    var posts: [Post]? {get set}
    func tapOnThePost(post: Post?)
}

class MainPresenter: MainViewPresenterProtocol {
  
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var posts: [Post]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getPosts()
    }
    
    func getPosts() {
        networkService.getPosts { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
           
            switch result {
            
            case .success(let posts):
                self.posts = posts
                self.view?.succes()
            case .failure(let error):
                self.view?.failure(error: error)
            }
            }
        }
    }
    
    func tapOnThePost(post: Post?) {
        router?.showComments(post: post)
    }
    
}
