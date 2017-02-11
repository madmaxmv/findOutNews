//
//  MenuModel.swift
//  findOut
//
//  Created by Максим on 06/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

struct Group {
    let name: String
    var isSelected: Bool
}

class MenuModel {
    public static let instance = MenuModel()
    private init() {
        VKService.instance.getGroupInfo { info in
            
        }
    }
    
    public var groups = [
        Group(name: "Вконтакте dev", isSelected: false),
        Group(name: "Habrahabr", isSelected: true),
        Group(name: "ТП", isSelected: true),
        Group(name: "Подслушано", isSelected: false),
        Group(name: "/dev/null", isSelected: true),
    ]
}
