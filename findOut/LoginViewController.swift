//
//  LoginViewController.swift
//  findOut
//
//  Created by Максим on 07/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    private var loginView: LoginView {
        return view as! LoginView
    }
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.controller = self
        loginView.setup()
    }
    
    public func login() {
        LoginService.instance.login()
        goToRcords()
    }
    
    public func ignoreLogin() {
        LoginService.instance.login()
        goToRcords()
    }

    private func goToRcords() {
        let appDelegate = UIApplication.shared.delegate
        appDelegate?.window!!.rootViewController = ContainerViewController()
        appDelegate?.window!!.makeKeyAndVisible()
    }
}
