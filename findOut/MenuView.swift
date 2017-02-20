//
//  MenuView.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class MenuView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!

    private var model: MenuViewModel!
    private let disposeBag = DisposeBag()

    public func setup(for viewModel: MenuViewModel) {
        model = viewModel

        addGroupView(forGroup: model.groups.first!, to: scrollView)
    }

    private func addGroupView(forGroup group: VKGroup, to superview: UIView) {
        let view = Bundle.main.loadNib(named: "GroupView") as GroupView
        view.setup(forGroup: group)
        view.frame = superview.frame
        view.frame.origin.y = 0
        superview.addSubview(view)
//        
//        let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
//                                               toItem: superview, attribute: .top,multiplier: 1, constant: 0)
//        let bottomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
//                                                  toItem: superview, attribute: .bottom, multiplier: 1, constant: 0)
//        let trailingConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal,
//                                                    toItem: superview, attribute: .trailing, multiplier: 1, constant: 0)
//        let leadingConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal,
//                                                   toItem: superview, attribute: .leading, multiplier: 1, constant: 0)
//        
//        view.addConstraints([topConstraint, bottomConstraint, trailingConstraint, leadingConstraint])
    }

}
