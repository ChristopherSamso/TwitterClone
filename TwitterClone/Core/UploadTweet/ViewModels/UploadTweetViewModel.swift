//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/30/22.
//

import Foundation
import SwiftUI


class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    @Published var tweets = [Tweet]()
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
                self.reloadTweets()
            } else {
                // Show error message to user
            }
        }
    }
    
    func reloadTweets() {
        print("CHRIS in reload tweets")
        service.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
    
}
