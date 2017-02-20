//
//  RecordCell.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import Async

class RecordCell: UITableViewCell {

    struct Model {
        let title: String
        let url: URL?
        let repostsCount: Int
        let likesCount: Int
    }

    @IBOutlet weak var cellContentView: UIView!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var recordImageView: UIImageView!
    @IBOutlet weak var recordImageHeight: NSLayoutConstraint!

    @IBOutlet weak var repostsView: UIView!
    @IBOutlet weak var repostsCountLabel: UILabel!

    @IBOutlet weak var commentsView: UIView!
    @IBOutlet weak var commentsCountLabel: UILabel!

    @IBOutlet weak var likesView: UIView!
    @IBOutlet weak var likesCountLabel: UILabel!

    public func setup(for record: VKWallRecord) {

        titleLabel.isHidden = !record.text.isEmpty
        titleLabel.text = record.text

        if let url = record.imageURL {
            Async.background { [weak self] in
                do {
                    let imageData = try! Data(contentsOf: url)
                    Async.main {
                        if let imgView = self?.recordImageView, let image = UIImage(data: imageData) {
                            imgView.image = image
                            let height = image.size.height * imgView.bounds.size.width / image.size.width
                            self?.recordImageHeight.constant = height < 350 ? height : 350
                        }
                    }
                }
            }
        }

        backgroundColor = UIColor.clear

        cellContentView.layer.cornerRadius = 12

        repostsView.isHidden = (record.reposts.count == 0)
        repostsCountLabel.text = record.reposts.count.description

        commentsView.isHidden = (record.comments.count == 0)
        commentsCountLabel.text = record.comments.count.description

        likesView.isHidden = (record.likes.count == 0)
        likesCountLabel.text = record.likes.count.description
    }
}
