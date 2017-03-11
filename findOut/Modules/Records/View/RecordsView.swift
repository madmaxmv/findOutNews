//
//  RecordsView.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class RecordsView: UIView {

    @IBOutlet weak var tableView: UITableView!

    fileprivate var model: RecordsViewModel!
    fileprivate let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<RecordsViewModel.SectionType, RecordsViewModel.Row>>()

    weak var controller: UIViewController?
    private var disposeBag = DisposeBag()

    public func setup(for viewModel: RecordsViewModel) {
        model = viewModel

        tableView.register(RecordCell.self)
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension

        //--------------------------------------------------------------
        /// Настраиваем дата сорс.
        //--------------------------------------------------------------
        dataSource.configureCell = { (_, tableView, indexPath, item) in
            switch item.type {
            case .record:
                let cell = tableView.dequeueReusableCell(for: indexPath) as RecordCell
                cell.setup(for: item.value)
                cell.controller = self.controller
                return cell
            }
        }

        //--------------------------------------------------------------
        /// Биндим dataSource ячейкам.
        //--------------------------------------------------------------
        model.dataSource.asObservable()
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)

        tableView.delegate = self
    }
}

extension RecordsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return model.record(for: indexPath).height
    }
}
