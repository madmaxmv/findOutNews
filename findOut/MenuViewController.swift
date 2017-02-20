//
//  MenuViewController.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift

class MenuViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    private var menuTableView: MenuTableView {
        return view as! MenuTableView
    }

    private var menuView: MenuView {
        return view as! MenuView
    }

    var model = MenuModel.instance
    weak var delegate: ContainerViewController?

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        model.loading.subscribe(onNext: { [unowned self] isLoading in
            if !isLoading && !self.model.groups.isEmpty {
                self.menuView.setup(for: MenuViewModel(groups: self.model.groups))
            }
        }).addDisposableTo(disposeBag)

        //menuTableView.setup(for: MenuTableViewModel(groups: model.groups))
    }

}
