//
//  Optional.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import Foundation

protocol Emptiable {
    var isEmpty: Bool { get }
}

extension String: Emptiable {}

extension Optional where Wrapped: Emptiable {
    var isEmptyOrNil: Bool {
        switch self {
        case .none: return true
        case .some(let value): return value.isEmpty
        }
    }
}
