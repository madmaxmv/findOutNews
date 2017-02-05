//
//  NewsModel.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift

class RecordsModel {
    
    public var loading = PublishSubject<Bool>()
    
    public var records: [VKWallRecord] {
        return _records!
    }
    
    private var _recordsCount: Int?
    private var _records: [VKWallRecord]?
    
    init() {}
    
    public func loadWall() {
        loading.onNext(true)
        VKService.instance.getGroupNews { [unowned self] response in
            self._recordsCount = response.recordsCount
            self._records = response.records
            self.loading.onNext(false)
        }
    }
}
