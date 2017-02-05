//
//  TimeStampTransform.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Преобразование даты для передачи на сервер в JSON
internal class TimeStampTransform: TransformType {
    
    typealias Object = Date
    typealias JSON = Int
    
    init() {}
    
    /// Функция преобразует из JSON в дату.
    func transformFromJSON(_ value: Any?) -> Date? {
        if let timeInt = value as? Int {
            return Date(timeIntervalSince1970: TimeInterval(timeInt))
        }
        return nil
    }
    
    /// Функция преобразует в JSON из даты.
    func transformToJSON(_ value: Date?) -> Int? {
        if let date = value {
            return Int(date.timeIntervalSince1970)
        }
        return nil
    }
}
