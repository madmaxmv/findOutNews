//
//  VKWallAttachment.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

public enum VKAttachmentType: String {
    case photo       = "photo"
    case postedPhoto = "posted_photo"
    case video       = "video"
    case audio       = "audio"
    case doc         = "doc"
    case graffiti    = "graffiti"
    case link        = "link"
    case note        = "note"
    case app         = "app"
    case poll        = "poll"
    case page        = "page"
    case album       = "album"
    case photosList  = "photos_list"
    case market      = "market"
    case marketAlbum = "market_album"
    case sticker     = "sticker"
}

/// Информация о медиавложениях в записях.
public struct VKWallAttachment: ImmutableMappable {
    
    /// Тип вложения.
    public let type: VKAttachmentType
    
    /// Медиавложение, которое зависит от типа `type`.
    public var attachment: VKAttachment
    
    public init(map: Map) throws {
        type = try map.value("type")
        attachment = try VKAttachment(map: map, type: type)
    }
}

extension VKWallAttachment: RecortImageable {
    var imageURL: URL? {
        return attachment.imageURL
    }
}
