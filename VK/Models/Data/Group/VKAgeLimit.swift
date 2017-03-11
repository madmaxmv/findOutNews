//
//  VKAgeLimit.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

/// возрастное ограничение.
public enum VKAgeLimit: Int, CustomStringConvertible {
    case none = 1
    case sixteen = 2
    case eighteen = 3

    public var description: String {
        switch self {
        case .none: return "0+"
        case .sixteen: return "16+"
        case .eighteen: return "18+"
        }
    }
}
