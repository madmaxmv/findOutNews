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

    private let scope = ["wall"]

    public let isUserLogin = Variable<Bool>(false)

    public func login(onComplete: @escaping () -> Void) {
        VKService.instance
            .wakeUpSession(withScope: scope) { [unowned self] state in
                switch state {
                case .authorized:
                    // использовать старый токен.
                    break
                case .initialized:
                    // Зарегестрироваться и войти через ВК.
                    VKService.instance.authorize(self.scope) { result in
                        if let token = result.token {
                            print(token)
                        } else {
                            print("Fuck, authorize error")
                        }
                    }
                default:
                    // повторить попытку позже.
                    break
                }
        }
        setupVKService(onComplete: onComplete)
    }

    private func setupVKService(onComplete: @escaping () -> Void) {
        VKService.instance.getGroupNews(onSuccess: { _ in
            self.isUserLogin.value = true
            onComplete()
        })
    }
}
