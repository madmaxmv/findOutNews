//
//  VKLikesInfo.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Информация о лайках к записи
public struct VKLikesInfo: ImmutableMappable {

    /// число пользователей, которым понравилась запись
    public let count: Int

    /// наличие отметки «Мне нравится» от текущего пользователя (1 — есть, 0 — нет).
    public let userLikes: Bool?

    /// информация о том, может ли текущий пользователь поставить отметку «Мне нравится» (1 — может, 0 — не может)
    public let canLike: Bool?

    /// информация о том, может ли текущий пользователь сделать репост записи (1 — может, 0 — не может).
    public let canPublish: Bool?

    public init(map: Map) throws {
        count      = try map.value("count")
        userLikes  = try? map.value("user_likes")
        canLike    = try? map.value("can_like")
        canPublish = try? map.value("can_publish")
    }
}
