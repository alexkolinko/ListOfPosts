//
//  CommentsViewController.swift
//  ListOfPosts
//
//  Created by Alexandr on 08.04.2021.
//

import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CommentsViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        CommentCell.register(to: self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getComments()
    }
    
    private func setNavigationBar(commentsCount: Int) {
        let countString = String(commentsCount)
        navigationItem.title = "Comments (\(countString))"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        let backBTN = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let commentsCount = presenter.comments?.count ?? 0
        self.setNavigationBar(commentsCount: commentsCount)
        return commentsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        let comment = presenter.comments?[indexPath.row]
        cell.updateUI(comment: comment)
        return cell
    }
}

extension CommentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension CommentsViewController: CommentsViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print("ERROR -- \(error.localizedDescription)")
    }
}
