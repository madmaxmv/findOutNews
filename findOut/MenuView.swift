//
//  MenuView.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class MenuView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var model: MenuViewModel!
    private let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<MenuViewModel.SectionType, MenuViewModel.Row>>()
    private let disposeBag = DisposeBag()
    
    public func setup(for viewModel: MenuViewModel) {
        model = viewModel
        tableView.register(GroupCell.self)
        
        tableView.estimatedRowHeight = 81
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
        //--------------------------------------------------------------
        /// Настраиваем дата сорс.
        //--------------------------------------------------------------
        dataSource.configureCell = { (_, tableView, indexPath, item) in
            switch item.type {
            case .group:
                let cell = tableView.dequeueReusableCell(for: indexPath) as GroupCell
                cell.setup(for: item.value as! GroupCell.Model)
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

// Mark: Table View Delegate
extension MenuView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! GroupCell
        cell.toggle()
    }
}
