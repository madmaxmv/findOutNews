//
//  RecordCell.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift
import Agrume
import Imaginary

class RecordCell: UITableViewCell {

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

    public var didSelect = PublishSubject<Void>()

    weak var controller: UIViewController?

    var cellImage = PublishSubject<UIImage?>()

    public func setup(for record: VKWallRecord) {

        if record.text.isEmpty {
            titleLabel.isHidden = true
        } else {
            titleLabel.isHidden = false
            titleLabel.text = record.text

        }

        for attachment in record.attachments ?? [] {
            switch attachment.attachment {
            case .photo(let photo):
                recordImageView.setImage(url: photo.photo604)
                if photo.width > 0 {
                    let height = CGFloat(photo.height) * UIScreen.main.bounds.width / CGFloat(photo.width)
                    recordImageHeight.constant = height
                }
            default: break
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

    override func awakeFromNib() {
        super.awakeFromNib()
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        imageTapGesture.cancelsTouchesInView = false
        recordImageView.addGestureRecognizer(imageTapGesture)
    }

    func imageTap(_ sender: UITapGestureRecognizer) {
        if let image = recordImageView.image, let controller = controller {
            let agrume = Agrume(image: image,
                                backgroundBlurStyle: .light,
                                backgroundColor: UIColor.black)
            agrume.showFrom(controller)
        }
    }
}
