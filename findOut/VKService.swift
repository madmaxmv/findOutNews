//
//  VKService.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper
import VK_ios_sdk

class VKService: NSObject {
    public static let instance = VKService()
    private override init() {
        super.init()
    }
    
    var response: VKWallResponse?
    
    public func setup() {
        VKSdk.initialize(withAppId: "qwerty").register(self)
    }
    
    
    func getGroupNews(onSuccess: @escaping (VKWallResponse) -> Void) {
        if let response = response {
            onSuccess(response)
            return
        }
        VKWallRequest(ownerId: "-26030283")
            .execute(onSuccess: { response in
                self.response = response
                onSuccess(response)
            }, onError: { error in print(error) }
        )
    }
    
    func getGroupInfo(onSuccess: @escaping (VKGroupResponse) -> Void) {
        VKGroupRequest(groupId: 26030283, fields: ["activity", "description", "status", "city", "age_limits"])
            .execute(onSuccess: { response in
                onSuccess(response)
            }, onError: { error in print(error) }
        )
    }
}


extension VKService: VKSdkDelegate {
    
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

