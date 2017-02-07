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
    @IBOutlet weak var repostsCountLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    
    @IBOutlet weak var titleLabelHeight: NSLayoutConstraint!
    
    public func setup(for data: Model) {
        
        if !data.title.isEmpty {
            titleLabel.text = data.title
            titleLabelHeight.constant = 80
        } else {
            titleLabelHeight.constant = 0
        }
        
        if let url = data.url {
            Async.background {
                do {
                    let imageData = try! Data(contentsOf: url)
                    Async.main {
                        self.recordImageView.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        cellContentView.layer.cornerRadius = 10
        
        repostsCountLabel.text = data.repostsCount.description
        likesCountLabel.text = data.likesCount.description
    }
}
