//
//  CommentCell.swift
//  ListOfPosts
//
//  Created by Alexandr on 09.04.2021.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var emailComment: UILabel!
    @IBOutlet weak var bodyComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(comment: Comment?) {
        self.emailComment.text = comment?.email
        self.bodyComment.text = comment?.body
    }
    
}

extension CommentCell {
    static func register(to tableView: UITableView) {
        let cellString = String(describing: self)
        let cellNib = UINib(nibName: cellString, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellString)
    }
}
