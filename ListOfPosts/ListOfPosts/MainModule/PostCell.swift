//
//  PostCell.swift
//  ListOfPosts
//
//  Created by Alexandr on 09.04.2021.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var bodyPost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(post: Post?) {
        self.titlePost.text = post?.title
        self.bodyPost.text = post?.body
    }

    
}

extension PostCell {
    static func register(to tableView: UITableView) {
        let cellString = String(describing: self)
        let cellNib = UINib(nibName: cellString, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellString)
    }
}
