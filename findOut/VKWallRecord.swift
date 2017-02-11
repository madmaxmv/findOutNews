//
//  VKWallRecord.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

public struct VKWallRecord: ImmutableMappable {
    
    /// идентификатор записи.
    public let id: Int
    
    /// идентификатор владельца стены, на которой размещена запись
    public let ownerId: Int
    
    /// идентификатор автора записи.
    public let fromId: Int
    
    /// время публикации записи в формате unixtime.
    public let date: Date
    
    /// текст записи.
    public let text: String
    
    /// идентификатор владельца записи, в ответ на которую была оставлена текущая.
    public let replyOwnerId: Int?
    
    /// идентификатор записи, в ответ на которую была оставлена текущая.
    public let replyPostId: Int?
    
    /// 1, если запись была создана с опцией «Только для друзей».
    public let friendsOnly: Bool?
    
    /// информация о комментариях к записи
    public let comments: VKCommentsInfo
    
    /// информация о лайках к записи
    public let likes: VKLikesInfo
    
    /// информация о репостах записи («Рассказать друзьям»)
    public let reposts: VKRepostsInfo
    
    /// тип записи, может принимать следующие значения: post, copy, reply, postpone, suggest.
    public let postType: VKPostType
    
    /// медиавложения записи (фотографии, ссылки и т.п.)
    public let attachments: [VKWallAttachment]?
    
//    public let geo: VKGeo
    
    /// идентификатор автора, если запись была опубликована от имени сообщества и подписана пользователем;
    public let signerId: Int?
    
    /// массив, содержащий историю репостов для записи. 
    /// Возвращается только в том случае, если запись является репостом. 
    /// Каждый из объектов массива, в свою очередь, является объектом-записью стандартного формата.
//    public let copyHistory: [VKWallRecord] // copy_history
    
    /// информация о том, может ли текущий пользователь закрепить запись (1 — может, 0 — не может).
//    public let canPin: Bool // can_pin
    
    /// информация о том, может ли текущий пользователь удалить запись (1 — может, 0 — не может).
//    public let canDelete: Bool // can_delete
    
    /// информация о том, может ли текущий пользователь редактировать запись (1 — может, 0 — не может).
//    public let canEdit: Bool // can_edit
    
    /// информация о том, закреплена ли запись (1 — закреплена, 0 — не закреплена); .
//    public let isPained: Bool //is_pinned
    
    /// информация о том, содержит ли запись отметку "реклама" (1 — да, 0 — нет).
    public let markedAsAds: Bool
    
    public init(map: Map) throws {
        id           = try map.value("id")
        ownerId      = try map.value("owner_id")
        fromId       = try map.value("from_id")
        date         = try map.value("date", using: TimeStampTransform())
        text         = try map.value("text")
        replyOwnerId = try? map.value("reply_owner_id")
        replyPostId  = try? map.value("reply_post_id")
        friendsOnly  = try? map.value("friends_only")
        comments     = try map.value("comments")
        likes        = try map.value("likes")
        reposts      = try map.value("reposts")
        
        postType     = try map.value("post_type")
        attachments  = try? map.value("attachments")
        signerId     = try? map.value("signer_id")
        
        markedAsAds  = try map.value("marked_as_ads")
    }
}

extension VKWallRecord: RecortImageable {
    var imageURL: URL? {
        return attachments?.first?.imageURL
    }
}
