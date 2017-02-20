//
//  Bundle+.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import Foundation

extension Bundle {
    func value<T>(forKey key: String, defVal: T? = nil) -> T? {
        if let res = self.object(forInfoDictionaryKey: key) as? T {
            return res
        }
        return defVal
    }

    func loadNib<T>(named name: String) -> T {
        return Bundle.main.loadNibNamed(name, owner: self, options: nil)![0] as! T
    }
}
