//
//  PosterModel.swift
//  Inspire Challenge
//
//  Created by Mupparaju Rao on 24/10/23.
//

import Foundation



struct PosterModel: Codable, Hashable {
    var posts: [Posters]
}

struct Posters : Codable, Hashable {
    var id, trackingId, slug: String
    var author: Author
    var url, title, content: String
    var created: String
    var updated: String
    var reactions: [Reaction]
    var isFollowed: Bool
    var replyCountNonDeleted: Int
}

struct Author : Codable, Hashable {
    var nickname: String
    var avatar: Avatar
}


struct Avatar : Codable, Hashable {
    var small: String
}


struct Reaction : Codable, Hashable {
    var type: String
    var count: Int
    var reacted_by_me: Bool
    var users: String
}
