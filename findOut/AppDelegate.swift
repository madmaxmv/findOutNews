//
//  AppDelegate.swift
//  findOut
//
//  Created by Максим on 03/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import VK_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        VKSdk.initialize(withAppId: "qwerty").register(self)
//        VKSdk.wakeUpSession(["messages"]) { state, error in
//            switch state {
//            case .authorized:
//                break
//            default:
//                VKSdk.authorize(["message"])
//            }
//        }
//
//        
//        window?.rootViewController = UIStoryboard(name: "Records", bundle: nil).instantiateInitialViewController()
//        window?.makeKeyAndVisible()
//
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String)
        return true
    }
}

extension AppDelegate: VKSdkDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if let token = result.token {
            print(token)
        } else {
            print("Fuck, why are you so stuped")
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("Fuck, vk Sdk User Authorization Failed")
    }
}

