//
//  MenuViewModel.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift
import RxDataSources

class MenuViewModel {
    
    enum SectionType {
        case groups
    }
    
    enum RowType {
        case group
    }
    
    typealias Row = (type: RowType, value: Any?)
    typealias Section = (type: SectionType, rows: [Row])
    
    public var dataSource = Variable<[SectionModel<MenuViewModel.SectionType, MenuViewModel.Row>]>([])
    
    public init(groups: [Group]) {
        dataSource.value = [
            SectionModel(model: .groups,
                         items: groups.map { group in
                            return (type: .group,
                                    value: GroupCell.Model(groupName: group.name,
                                                           isSelected: group.isSelected) as? Any)
            })
        ]
    }
}

