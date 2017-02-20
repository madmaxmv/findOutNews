//
//  GroupCell.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var checkMarkImageView: UIImageView!

    struct Model {
        let groupName: String
        let isSelected: Bool
    }

    public func setup(for model: Model) {
        groupNameLabel.text = model.groupName
        switchCheckBox(on: model.isSelected)
        selectionStyle = .none

        currentValue = model.isSelected
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
