//
//  MenuModel.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift

struct Group {
    let name: String
    var isSelected: Bool
}

class MenuModel {
    public static let instance = MenuModel()
    private init() {
        loading.onNext(true)
        VKService.instance.getGroupInfo { info in
            self.groups = info.groups
            self.loading.onNext(false)
        }
    }
    public let loading = PublishSubject<Bool>()
    public var groups: [VKGroup] = []
//    public var groups = [
//        Group(name: "Вконтакте dev", isSelected: false),
//        Group(name: "Habrahabr", isSelected: true),
//        Group(name: "ТП", isSelected: true),
//        Group(name: "Подслушано", isSelected: false),
//        Group(name: "/dev/null", isSelected: true),
//    ]
}
