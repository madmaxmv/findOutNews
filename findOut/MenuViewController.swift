//
//  MenuViewController.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    private var menuView: MenuView {
        return view as! MenuView
    }
    
    var model = MenuModel.instance
    weak var delegate: ContainerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.setup(for: MenuViewModel(groups: model.groups))
    }
    
}
