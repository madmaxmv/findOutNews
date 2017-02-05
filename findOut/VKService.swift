//
//  VKService.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper
import VK_ios_sdk

class VKService {
    public static let instance = VKService()
    private init() {}
    
    func getGroupNews(onSuccess: @escaping (VKGetWallResponse) -> Void) {
        let newsRequest = VKApi.request(withMethod: "wall.get",
                                        andParameters: ["owner_id": "-26030283"])
        
        newsRequest?.execute(resultBlock: { response in
            print(response?.json ?? "")
            if let json = response?.json {
                do{
                    let objectResponse = try Mapper<VKGetWallResponse>().map(JSONObject: json)
                    onSuccess(objectResponse)
                } catch {
                    print(error)
                }
            }
        }, errorBlock: { error in
            let nsError = error as! NSError
            if Int32(nsError.code) != VK_API_ERROR {
                nsError.vkError.request.repeat()
            } else {
                print(nsError)
            }
        })
    }
}
