//
//  VKDoc.swift
//  findOut
//
//  Created by Максим on 05/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

public struct VKDoc: ImmutableMappable {

    /// идентификатор документа.
    public let id: Int

    /// идентификатор владельца документа.
    public let ownerId: Int

    /// название документа.
    public let title: String

    /// размер документа в байтах.
    public let size: Int

    /// расширение документа.
    public let ext: String

    /// адрес документа, по которому его можно загрузить.
    public let url: URL

    /// дата добавления в формате Unixtime.
    public let date: Date

    /// тип документа.
    public let type: VKDocType

    public init(map: Map) throws {
        id = try map.value("id")
        ownerId = try map.value("owner_id")
        title = try map.value("title")
        size = try map.value("size")
        ext = try map.value("ext")
        url = try map.value("url", using: URLTransform())
        date = try map.value("date", using: DateTransform())
        type = try map.value("type")
    }
}

public enum VKDocType: Int {
    /// — текстовые документы;
    case text = 1
    ///  — архивы;
    case archive = 2
    ///  — gif;
    case gif = 3
    /// — изображения;
    case image = 4
    /// — аудио;
    case audio = 5
    /// — видео;
    case video = 6
    /// — электронные книги;
    case ebook = 7
    /// — неизвестно.
    case unknown = 8
}
