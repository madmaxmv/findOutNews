//
//  RecordView.swift
//  findOut
//
//  Created by Максим on 05/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class RecordTableView: UITableView {
    
    enum SectionType {
        case records
    }
    
    enum RowType {
        case text
    }
    
    typealias Row = (type: RowType, value: Any?)
    typealias Section = (type: SectionType, rows: [Row])
    
    var ownDataSource = RxTableViewSectionedReloadDataSource<SectionModel<SectionType, Row>>()
    
    public func setup(for record: VKWallRecord) {
        var tmpldataSource = Variable<[SectionModel<SectionType, Row>]>([])
        var rows: [Row] = []
        
        if !record.text.isEmpty {
            rows.append((type: .text, value: record.text))
        }
        
        record.attachments?.forEach { attachment in
            
            
            
        }
//        tmpldataSource.value = [
//                SectionModel(model: .records,
//                             items: records.map { record in
//                                let data = RecordCell.Model(title:        record.text,
//                                                            url:          record.imageURL,
//                                                            repostsCount: record.reposts.count,
//                                                            likesCount:   record.likes.count
//                                )
//                                return (type: .record, value: data)
//                })
//            ]
//        }
    }
    
}
