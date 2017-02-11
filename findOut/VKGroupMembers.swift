//
//  VKGroupMembers.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Cписок участников сообщества.
struct VKGroupMembers: ImmutableMappable {
    
    /// Количество участников.
    public let count: Int
    
    /// Идентификаторы участников.
    public let members: [Int]
    
    public init(map: Map) throws {
        count   = try map.value("count")
        members = try map.value("members")
    }
}
