//
//  RecordsScrollView.swift
//  findOut
//
//  Created by Максим on 05/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class RecordsScrollView: UIView {

    @IBOutlet weak var scrollView: UIScrollView!

    private var model: RecordsViewModel!
    private let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<RecordsViewModel.SectionType, RecordsViewModel.Row>>()

    private var disposeBag = DisposeBag()

    public func setup(viewModel: RecordsViewModel) {
        model = viewModel

    }
}
