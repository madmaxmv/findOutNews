//
//  VKAttachment.swift
//  findOut
//
//  Created by Максим on 04/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import ObjectMapper

struct VKAttachmentError: Error {
    let description: String
}

public enum VKAttachment {
    case photo(VKPhoto)
    case link(VKLink)
    case doc(VKDoc)
    
    init(map: Map, type: VKAttachmentType) throws {
        switch type {
        case .link:
            let link: VKLink = try map.value(type.rawValue)
            self = .link(link)
        case .photo:
            let photo: VKPhoto = try map.value(type.rawValue)
            self = .photo(photo)
        case .doc:
            let doc: VKDoc = try map.value(type.rawValue)
            self = .doc(doc)
        default:
            throw VKAttachmentError(description: "Unknown type")
        }
    }
}

extension VKAttachment: RecortImageable {
    var imageURL: URL? {
        switch self {
        case .link(let link):
            return link.imageURL
        case .photo(let photo):
            return photo.imageURL
        default: return nil
        }
    }
}
