//
//  ModuleBuilder.swift
//  ListOfPosts
//
//  Created by Alexandr on 08.04.2021.
//

import Foundation
import UIKit

protocol AssembleBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
     func createCommentsModule(post: Post?, router: RouterProtocol) -> UIViewController
}

class AssembleModelBuilder: AssembleBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createCommentsModule(post: Post?, router: RouterProtocol) -> UIViewController {
        let view = CommentsViewController()
        let networkService = NetworkService()
        let presenter = CommentsPresenter(view: view, networkService: networkService, router: router, post: post)
        view.presenter = presenter
        return view
    }
    
}
