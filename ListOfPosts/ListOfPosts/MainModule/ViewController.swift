//
//  ViewController.swift
//  ListOfPosts
//
//  Created by Alexandr on 08.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        PostCell.register(to: self.tableView)
    }
    
    private func setNavigationBar() {
         navigationItem.title = "Leanne Graham"
     let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
     navigationController?.navigationBar.titleTextAttributes = textAttributes
   
     }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = presenter.posts?[indexPath.row]
        cell.updateUI(post: post)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = presenter.posts?[indexPath.row]
        presenter.tapOnThePost(post: post)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print("ERROR -- \(error.localizedDescription)")
    }
}

