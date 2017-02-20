//
//  VKPostedPhoto.swift
//  findOut
//
//  Created by Максим on 05/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Устаревший тип вложения. Он может быть возвращен лишь для записей, созданных раньше 2013 года.
public struct VKPostedPhoto: ImmutableMappable {

    /// идентификатор фотографии.
    public let id: Int

    /// идентификатор владельца фотографии.
    public let ownerId: Int

    /// URL изображения для предпросмотра.
    public let photo130: URL?

    /// URL полноразмерного изображения.
    public let photo604: URL?

    public init(map: Map) throws {
        id       = try map.value("id")
        ownerId  = try map.value("owner_id")
        photo130 = try map.value("photo_130")
        photo604 = try map.value("photo_604")
    }
}
