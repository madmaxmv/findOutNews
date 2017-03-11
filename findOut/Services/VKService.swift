//
//  VKService.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper
import RxSwift
import VK_ios_sdk

class VKService: NSObject {
    public static let instance = VKService()
    private override init() {
        super.init()
        setup()
    }

    var response: VKWallResponse?

    fileprivate let authorizeComplete = PublishSubject<VKAuthorizationResult>()
    private let disposeBag = DisposeBag()

    public func setup() {
        VKSdk.initialize(withAppId: "com.none.eggApp").register(self)
    }

    public func wakeUpSession(withScope scope: [String], onComplete: @escaping (VKAuthorizationState) -> Void) {
        VKSdk.wakeUpSession(scope) { state, error in
            onComplete(state)
        }
    }

    public func authorize(_ scope: [String], onComplete: @escaping (VKAuthorizationResult) -> Void) {
        VKSdk.authorize(scope)
        authorizeComplete.subscribe(onNext: { result in
            onComplete(result)
        }).addDisposableTo(disposeBag)
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

    func getGroupInfo(groupIds: [Int], onSuccess: @escaping (VKGroupResponse) -> Void) {
        VKGroupRequest(groupIds: groupIds, fields: ["activity", "description", "status", "city", "age_limits", "members_count"])
            .execute(onSuccess: { response in
                onSuccess(response)
            }, onError: { error in print(error) }
        )
    }
}

extension VKService: VKSdkDelegate {

    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        authorizeComplete.onNext(result)
    }

    func vkSdkUserAuthorizationFailed() {
        print("Fuck, vk Sdk User Authorization Failed")
    }
}
