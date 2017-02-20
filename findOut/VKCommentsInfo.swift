//
//  VKCommentsInfo.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Информация о комментариях к записи
public struct VKCommentsInfo: ImmutableMappable {

    /// количество комментариев.
    public let count: Int

    /// информация о том, может ли текущий пользователь комментировать запись.
    public let canPost: Bool?

    public init(map: Map) throws {
        count = try map.value("count")
        canPost = try? map.value("can_post")
    }
}
