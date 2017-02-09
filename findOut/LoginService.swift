//
//  LoginService.swift
//  findOut
//
//  Created by Максим on 07/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import RxSwift

class LoginService {
    public static let instance = LoginService()
    private init() {}
    
    public let isUserLogin = Variable<Bool>(false)
    
    public func login() {
        setupVKService()
    }
    
    private func setupVKService() {
        VKService.instance.setup()
        VKService.instance.getGroupNews(onSuccess: { _ in
            self.isUserLogin.value = true
        })
    }
}
