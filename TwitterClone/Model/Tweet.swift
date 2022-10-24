//
//  Tweet.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/30/22.
//

import FirebaseFirestoreSwift
import Foundation
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let uid: String
    let caption: String
    var likes: Int
    let timestamp: Timestamp
    
    var user: User?
    var didLike: Bool? = false 
}

//let MOCK_TWEETS: [Tweet] = [
//    .init(uid: "1", caption: "YOOOOO whats up", likes: 32, timestamp: Timestamp()),
//    .init(uid: "2", caption: "YOOOOO whats up", likes: 32, timestamp: Timestamp()),
//    .init(uid: "3", caption: "YOOOOO whats up", likes: 32, timestamp: Timestamp()),
//    .init(uid: "4", caption: "YOOOOO whats up", likes: 32, timestamp: Timestamp()),
//    .init(uid: "5", caption: "YOOOOO whats up", likes: 32, timestamp: Timestamp()),
//    .init(uid: "6", caption: "YOOOOO whats up", likes: 32, timestamp: Timestamp()),
//]
//
//let MOCK_TWEET: Tweet = MOCK_TWEETS[0]
