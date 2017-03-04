//
//  VKPhoto.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Описывает фотографию.
public struct VKPhoto: ImmutableMappable {

    /// идентификатор фотографии.
    public let id: Int

    /// идентификатор альбома, в котором находится фотография.
    public let albumId: Int?

    /// идентификатор владельца фотографии.
    public let ownerId: Int

    /// идентификатор пользователя, загрузившего фото (если фотография размещена в сообществе).
    /// Для фотографий, размещенных от имени сообщества, user_id = 100.
    public let userId: Int?

    /// текст описания фотографии.
    public let text: String

    /// дата добавления в формате Unixtime.
    public let date: Date

    /// массив с копиями изображения в разных размерах.
    /// Поле возвращается только при передаче параметра photo_sizes = 1 в запросе. 
    /// Если параметр не передан, вместо поля sizes возвращаются поля, описанные ниже.
    //    public let sizes:

    /// URL копии фотографии с максимальным размером 75x75px.
    public let photo75: URL?

    /// URL копии фотографии с максимальным размером 130x130px.
    public let photo130: URL?

    /// URL копии фотографии с максимальным размером 640x640px.
    public let photo604: URL?

    /// URL копии фотографии с максимальным размером 807x807px.
    public let photo807: URL?

    /// URL копии фотографии с максимальным размером 1280x1024px.
    public let photo1280: URL?

    /// URL копии фотографии с максимальным размером 2560x2048px.
    public let photo2560: URL?

    /// ширина оригинала фотографии в пикселах
    public let width: Int

    /// высота оригинала фотографии в пикселах.
    public let height: Int

    public init(map: Map) throws {
        id        = try map.value("id")
        albumId   = try? map.value("album_id")
        ownerId   = try map.value("owner_id")
        userId    = try? map.value("user_id")
        text      = try map.value("text")
        date      = try map.value("date", using: TimeStampTransform())

        photo75   = try? map.value("photo_75", using: URLTransform())
        photo130  = try? map.value("photo_130", using: URLTransform())
        photo604  = try? map.value("photo_604", using: URLTransform())
        photo807  = try? map.value("photo_807", using: URLTransform())
        photo1280 = try? map.value("photo_1280", using: URLTransform())
        photo2560 = try? map.value("photo_2560", using: URLTransform())

        width     = try map.value("width")
        height    = try map.value("height")
    }
}
