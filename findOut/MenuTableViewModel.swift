//
//  MenuTableViewModel.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift
import RxDataSources

class MenuTableViewModel {

    enum SectionType {
        case groups
    }

    enum RowType {
        case group
    }

    typealias Row = (type: RowType, value: Group)
    typealias Section = (type: SectionType, rows: [Row])

    public var dataSource = Variable<[SectionModel<MenuTableViewModel.SectionType, MenuTableViewModel.Row>]>([])

    func updateGroups(groups: [Group]) {
        dataSource.value = [
            SectionModel(model: .groups,
                         items: groups.map { group in
                            return (type: .group, value: group)
            })
        ]
    }
}
