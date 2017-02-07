//
//  RecordsViewModel.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift
import RxDataSources

class RecordsViewModel {
    
    enum SectionType {
        case records
    }
    
    enum RowType {
        case record
    }
    
    typealias Row = (type: RowType, value: Any?)
    typealias Section = (type: SectionType, rows: [Row])
    
    public var dataSource = Variable<[SectionModel<RecordsViewModel.SectionType, RecordsViewModel.Row>]>([])
    
    public init(records: [VKWallRecord]) {
        dataSource.value = [
            SectionModel(model: .records,
                         items: records.map { record in
                            let data = RecordCell.Model(title:        record.text,
                                                        url:          record.imageURL,
                                                        repostsCount: record.reposts.count,
                                                        likesCount:   record.likes.count
                            )
                            return (type: .record, value: data)
            })
        ]
    }
}