//
//  VKRepostsInfo.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// информация о репостах записи («Рассказать друзьям»)
public struct VKRepostsInfo: ImmutableMappable {

    /// число пользователей, скопировавших запись
    public let count: Int

    /// наличие репоста от текущего пользователя (1 — есть, 0 — нет)
    public let userReposted: Bool?

    public init(map: Map) throws {
        count        = try map.value("count")
        userReposted = try? map.value("user_reposted")
    }
}
