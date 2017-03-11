//
//  VKWallResponse.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Response of method wall.get
/// https://vk.com/dev/wall.get
public struct VKWallResponse: ImmutableMappable {

    /// Number of records on the group wall.
    public let recordsCount: Int

    /// Array of records on the group wall.
    public let records: [VKWallRecord]

    public init(map: Map) throws {
        recordsCount = try map.value("count")
        records      = try map.value("items")
    }
}
