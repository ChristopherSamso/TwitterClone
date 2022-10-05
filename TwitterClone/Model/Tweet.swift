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
