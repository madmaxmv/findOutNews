//
//  GroupCell.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import Imaginary

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupType: UILabel!
    @IBOutlet weak var groupMembersCount: UILabel!

    @IBOutlet weak var groupAgeLimit: UILabel!
    @IBOutlet weak var checkMarkImageView: UIImageView!

    public func setup(for group: Group) {
        selectionStyle = .none

        groupNameLabel.text = group.value.name
        groupType.text = group.value.type.description

        if let ageLimit = group.value.ageLimit, ageLimit != .none {
            groupAgeLimit.show()
            groupAgeLimit.text = ageLimit.description
        } else {
            groupAgeLimit.hide()
        }

        groupMembersCount.text = group.value.membersCountDescription

        groupImage.setImage(url: group.value.photo100)

        switchCheckBox(on: group.isSelected)
        currentValue = group.isSelected
    }

    private func switchCheckBox(on value: Bool) {
        if value {
            self.select()
        } else {
            self.deslect()
        }
    }
    private  func select() {
        checkMarkImageView.image = UIImage(named: "selected")
    }
    private  func deslect() {
        checkMarkImageView.image = UIImage(named: "deselected")
    }

    private var currentValue: Bool!
    public func toggle() {
        currentValue = !currentValue
        switchCheckBox(on: currentValue)
    }
}

fileprivate extension VKGroup {
    var membersCountDescription: String {
        guard let membersCount = membersCount else {
            return ""
        }
        return "\(membersCount.description) \(membersCount.plural(forFormsGroup: "SubscribersCountText"))"
    }
}
