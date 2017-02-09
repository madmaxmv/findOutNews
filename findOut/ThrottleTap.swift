//
//  ThrottleTap.swift
//  findOut
//
//  Created by Максим on 07/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift

extension ObservableType {
    
    public func throttleTap(inScheduler scheduler: SchedulerType = MainScheduler.instance) -> Observable<Self.E>{
        return throttle(0.5, scheduler: scheduler)
    }
}
