//
//  VKWallRequest.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper
import VK_ios_sdk

public struct VKWallRequest {
    /// идентификатор пользователя или сообщества, со стены которого необходимо получить записи (по умолчанию — текущий пользователь).
    public var ownerId: String

    /// смещение, необходимое для выборки определенного подмножества записей.
    public var offset: Int?

    /// количество записей, которое необходимо получить. Максимальное значение: 100.
    public var count: Int?

    /// 1 — в ответе будут возвращены дополнительные поля profiles и groups, содержащие информацию о пользователях и сообществах.
    /// По умолчанию: 0.
    public var extended: Bool = false

    public init(ownerId: String, offset: Int? = nil, count: Int? = nil, extended: Bool = false) {
        self.ownerId = ownerId
        self.offset = offset
        self.count = count
        self.extended = extended
    }

    public func execute(onSuccess: @escaping (VKWallResponse) -> Void,
                        onError: @escaping (Error) -> Void) {
        var parameters = ["owner_id": ownerId, "extended": extended] as [String : Any]
        if let offset = offset {parameters["offset"] = offset }
        if let count = count { parameters["count"] = count }
        VKApi.request(withMethod: "wall.get",
                      andParameters: parameters
            )?.execute(resultBlock: { response in
                print(response?.json ?? "")
                if let json = response?.json {
                    do {
                        let objectResponse = try Mapper<VKWallResponse>().map(JSONObject: json)
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
