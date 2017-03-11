//
//  RecordsViewController.swift
//  findOut
//
//  Created by Максим on 03/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift

class RecordsViewController: UIViewController {

    private let model = RecordsModel()

    private var recordsView: RecordsView {
        return view as! RecordsView
    }

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "The Wall"

        recordsView.controller = self
        model.loading.filter { $0 == false }
            .subscribe(onNext: { [unowned self] _ in
                self.recordsView.setup(for: RecordsViewModel(records: self.model.records))
        }).addDisposableTo(disposeBag)
        model.loadWall()
    }
}
