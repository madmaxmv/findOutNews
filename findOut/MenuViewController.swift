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

    var model = MenuModel.instance
    var viewModel = MenuTableViewModel()
    weak var delegate: ContainerViewController?

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        model.loading.subscribe(onNext: { [unowned self] isLoading in
            if !isLoading && !self.model.groups.isEmpty {
                self.viewModel.updateGroups(groups: self.model.groups)
            }
        }).addDisposableTo(disposeBag)

        menuTableView.setup(for: viewModel)
    }

}
