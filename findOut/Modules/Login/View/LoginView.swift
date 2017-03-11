//
//  LoginView.swift
//  findOut
//
//  Created by Максим on 07/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginView: UIView {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var ignoreButton: UIButton!

    weak var controller: LoginViewController?

    private let disposeBag = DisposeBag()

    public func setup() {
        loginButton.layer.cornerRadius = 10
        ignoreButton.layer.cornerRadius = 10

        loginButton.rx.tap
            .throttleTap()
            .subscribe(onNext: { [unowned self] _ in
                self.controller?.login()
            })
            .addDisposableTo(disposeBag)

        ignoreButton.rx.tap
            .throttleTap()
            .subscribe(onNext: { [unowned self] _ in
                self.controller?.ignoreLogin()
            })
            .addDisposableTo(disposeBag)
    }
}
