//
//  URLTransform.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Преобразование даты для передачи на сервер в JSON
internal class URLTransform: TransformType {
    
    typealias Object = URL
    typealias JSON = String
    
    init() {}
    
    /// Функция преобразует из JSON в дату.
    func transformFromJSON(_ value: Any?) -> URL? {
        if let url = value as? String {
            return URL(string: url)
        }
        return nil
    }
    
    /// Функция преобразует в JSON из даты.
    func transformToJSON(_ value: URL?) -> String? {
        if let url = value {
            return url.description
        }
        return nil
    }
}
