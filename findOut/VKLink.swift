//
//  VKLink.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

/// Ссылка.
public struct VKLink: ImmutableMappable {

    /// URL ссылки.
    public let url: URL?

    /// заголовок ссылки.
    public let title: String

    /// подпись ссылки (если имеется).
    public let caption: String

    /// описание ссылки.
    public let description: String

    /// изображение превью.
    public let photo: VKPhoto

    /// является ли ссылка внешней (1 — является, 0 — не является).
    public let isExternal: Bool

    public init(map: Map) throws {
        url         = try? map.value("url", using: URLTransform())
        title       = try map.value("title")
        caption     = try map.value("caption")
        description = try map.value("description")
        photo       = try map.value("photo")
        isExternal  = try map.value("is_external")
    }
}

extension VKLink: RecortImageable {
    var imageURL: URL? {
        return photo.imageURL
    }
}
