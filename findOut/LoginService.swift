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

    public func login(onComplete: @escaping () -> Void) {
        setupVKService(onComplete: onComplete)
    }

    private func setupVKService(onComplete: @escaping () -> Void) {
        VKService.instance.setup()
        VKService.instance.getGroupNews(onSuccess: { _ in
            self.isUserLogin.value = true
            onComplete()
        })
    }
}
