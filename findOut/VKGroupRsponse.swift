//
//  VKGroupRsponse.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Результат на запрос информации о группе.
public struct VKGroupResponse: ImmutableMappable {

    /// Массив объектов, описывающих сообщества.
    public let groups: [VKGroup]
    
    public init(map: Map) throws {
        groups = try map.value("response")
    }
}
