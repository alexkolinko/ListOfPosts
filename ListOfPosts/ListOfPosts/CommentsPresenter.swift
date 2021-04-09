//
//  CommentsPresenter.swift
//  ListOfPosts
//
//  Created by Alexandr on 08.04.2021.
//

import Foundation

protocol CommentsViewProtocol: class {
    func succes()
    func failure(error: Error)
}

protocol CommentsViewPresenterProtocol: class {
    init(view: CommentsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, post: Post?)
    func getComments()
    var comments: [Comment]? {get set}
    func tap()
}

class CommentsPresenter: CommentsViewPresenterProtocol {
    
    weak var view: CommentsViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var post: Post?
    var comments: [Comment]?
    
    required init(view: CommentsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, post: Post?) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.post = post
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
            switch result {

            case .success(let comments):
                self.comments = comments?.filter {
                    $0.postId == self.post?.id
                }
                self.view?.succes()
            case .failure(let error):
                self.view?.failure(error: error)
            }
            }
        }
    }
}
