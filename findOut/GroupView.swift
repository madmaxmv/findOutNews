//
//  GroupView.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import Async

class GroupView: UIView {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupStatus: UILabel!
    @IBOutlet weak var groupType: UILabel!
    @IBOutlet weak var groupAgeLimit: UILabel!

    @IBOutlet weak var groupImageView: UIImageView!

    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var groupMembersCount: UILabel!

    @IBOutlet weak var subscribeButton: UIButton!

    func setup(forGroup group: VKGroup) {
        groupName.text = group.name

        groupStatus.isHidden = group.status.isEmptyOrNil
        groupStatus.text = group.status

        groupType.text = group.type.description
        groupAgeLimit.text = group.ageLimit?.description

        Async.background { [weak self] in
            do {
                let imageData = try! Data(contentsOf: group.photo200)
                Async.main {
                    self?.groupImageView.image = UIImage(data: imageData)
                }
            }
        }

        groupDescription.isHidden = group.description.isEmptyOrNil
        groupDescription.text = group.description

        groupMembersCount.text = group.membedCountDescription

    }
}

fileprivate extension VKGroup {
    var membedCountDescription: String {
        guard let membersCount = membersCount else {
            return ""
        }
        return "\(membersCount.description) \(membersCount.plural(forFormsGroup: "SubscribersCountText"))"
    }
}
