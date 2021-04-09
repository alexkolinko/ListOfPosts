//
//  Router.swift
//  ListOfPosts
//
//  Created by Alexandr on 09.04.2021.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var assembleBuilder: AssembleBuilderProtocol? {get set}
    
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showComments(post: Post?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    
    var assembleBuilder: AssembleBuilderProtocol?
    
    init(navigationController: UINavigationController, assembleBuilder: AssembleBuilderProtocol) {
        self.navigationController = navigationController
        self.assembleBuilder = assembleBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assembleBuilder?.createMainModule(router: self) else {return}
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showComments(post: Post?) {
        if let navigationController = navigationController {
            guard let commentsViewController = assembleBuilder?.createCommentsModule(post: post, router: self) else {return}
            navigationController.pushViewController(commentsViewController, animated: true)
        }

    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
