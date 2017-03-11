//
//  MenuModel.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift
import Async

struct Group {
    let value: VKGroup
    let isSelected: Bool
}

class MenuModel {
    public static let instance = MenuModel()
    private init() {
        loading.onNext(true)
        VKService.instance.getGroupInfo(groupIds: groupsIds) { [unowned self] info in
            info.groups.forEach {
                self.groups.append(Group(value: $0, isSelected: false))
            }
            self.loading.onNext(false)
        }
    }
    public let loading = PublishSubject<Bool>()
    public var groups: [Group] = []
    public var groupsIds = [
        34215577,
        129636704,
        30666517,
        57958529
    ]
}
