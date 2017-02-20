//
//  VKGroupType.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

/// тип сообщества
public enum VKGroupType: String, CustomStringConvertible {
    /// группа
    case group = "group"
    /// публичная страница;
    case page = "page"
    ///  мероприятие.
    case event = "event"

    public var description: String {
        switch self {
        case .group: return "Группа"
        case .page: return "Публичная страница"
        case .event: return "Мероприятие"
        }
    }
}
