//
//  VKGroupRequest.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper
import VK_ios_sdk

/// Пример: 
/// https://api.vk.com/method/groups.getById?group_id=26030283&v=5.52
public struct VKGroupRequest {

    public var groupIds: [Int]?

    public var groupId: Int?

    public var fields: [String]?

    public init(groupIds: [Int]? = nil, groupId: Int? = nil, fields: [String]? = nil) {
        self.groupIds = groupIds
        self.groupId = groupId
        self.fields = fields
    }

    public func execute(onSuccess: @escaping (VKGroupResponse) -> Void,
                        onError: @escaping (Error) -> Void) {

        var parameters: [String: Any] = [:]
        if let groupIds = groupIds, !groupIds.isEmpty {
            parameters["group_ids"] = groupIds.map { $0.description }.joined(separator: ",")
        }
        if let groupId = groupId { parameters["group_id"] = groupId }
        if let fields = fields { parameters["fields"] = fields.joined(separator: ",") }

        VKApi.request(withMethod: "groups.getById",
                      andParameters: parameters
            )?.execute(resultBlock: { response in
                print(response?.json ?? "")
                if let json = response?.json {
                    do {
                        // Необходимо обернуть массив в словарь, что бы мапилось.
                        let objectResponse = try Mapper<VKGroupResponse>().map(JSON: ["response": json])
                        onSuccess(objectResponse)
                    } catch {
                        onError(error)
                    }
                }
            }, errorBlock: { error in
                onError(error!)
            })
    }
}
