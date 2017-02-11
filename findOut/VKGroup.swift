//
//  VKGroup.swift
//  findOut
//
//  Created by Максим on 11/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

public enum VKGroupPrivacyType: Int {
    case open, close, `private`
}

/// тип сообщества
public enum VKGroupType: String {
    /// группа
    case group = "group"
    /// публичная страница;
    case page = "page"
    ///  мероприятие.
    case event = "event"
}

public enum VKAdminLevel: Int {
    case moderator = 1
    case redactor = 2
    case admin = 3
}

/// возрастное ограничение.
public enum VKAgeLimit: Int {
    case none = 1
    case sixteen = 2
    case eighteen = 3
}

/// Информация о сообществе ВКонтакте. Набор полей может меняться в зависимости от вызванного метода и переданных в нем параметров.
public struct VKGroup: ImmutableMappable {
    
    /// идентификатор сообщества.
    public let id: Int
    
    /// название сообщества.
    public let name: String
    
    /// тип сообщества
    public let type: VKGroupType
    
    /// текст описания сообщества.
    public let description: String?
    
    /// статус сообщества.
    public let status: String?
    
    /// строка состояния публичной страницы. 
    /// У групп возвращается строковое значение, открыта ли группа или нет, а у событий дата начала.
    public let activity: String?
    
    /// возрастное ограничение.
    public let ageLimit: VKAgeLimit?
    
    /// короткий адрес, например, apiclub.
    private let shortAddress: String
    
    /// является ли сообщество закрытым. 
    /// Возможные значения: 0 — открытое; 1 — закрытое; 2 — частное.
    public let privacyType: VKGroupPrivacyType
    
    /// возвращается в случае, если сообщество удалено или заблокировано. 
    /// Возможные значения: deleted — сообщество удалено; banned — сообщество заблокировано;
    public let deactivated: String?
    
    /// информация о том, является ли текущий пользователь руководителем.
    public let isAdmin: Bool?
    
    /// уровень полномочий текущего пользователя (если is_admin = 1):
    public let adminLevel: VKAdminLevel?
    
    /// информация о том, установлена ли у сообщества главная фотография.
    // private let hasPhoto: Bool
    
    public let photo50: URL
    public let photo100: URL
    public let photo200: URL
    
    public init(map: Map) throws {
        id           = try map.value("id")
        name         = try map.value("name")
        type         = try map.value("type")
        description  = try? map.value("description")
        status       = try? map.value("status")
        activity     = try? map.value("activity")
        
        ageLimit     = try? map.value("age_limits")
        
        shortAddress = try map.value("screen_name")
        privacyType  = try map.value("is_closed")
        deactivated  = try? map.value("deactivated")
        isAdmin      = try? map.value("is_admin")
        adminLevel   = try? map.value("admin_level")
        
        photo50      = try map.value("photo_50", using: URLTransform())
        photo100     = try map.value("photo_100", using: URLTransform())
        photo200     = try map.value("photo_200", using: URLTransform())
        
    }
}
