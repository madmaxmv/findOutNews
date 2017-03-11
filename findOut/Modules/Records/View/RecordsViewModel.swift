//
//  RecordsViewModel.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift
import RxDataSources

extension VKWallRecord {
    // Определение высоты ячейки по контенту в ней.
    var height: CGFloat {
        var recordHeight: CGFloat = 20 // Отступ
        if !text.isEmpty {
            recordHeight += 34
        }

        for attachment in attachments ?? [] {
            switch attachment.attachment {
            case .photo(let photo):
                let height = CGFloat(photo.height) * UIScreen.main.bounds.width / CGFloat(photo.width)
                recordHeight += height
            default: break
            }
        }
        recordHeight += 28 // лайки репосты

        return recordHeight
    }
}

class RecordsViewModel {

    enum SectionType {
        case records
    }

    enum RowType {
        case record
    }

    typealias Row = (type: RowType, value: VKWallRecord)
    typealias Section = (type: SectionType, rows: [Row])

    public var dataSource = Variable<[SectionModel<SectionType, Row>]>([])

    public init(records: [VKWallRecord]) {
        dataSource.value = [
            SectionModel(model: .records,
                         items: records.map { record in
                            return (type: .record,
                                    value: record)
            })
        ]
    }
    func record(for indexPath: IndexPath) -> VKWallRecord {
        return dataSource.value[indexPath.section].items[indexPath.row].value
    }
}
