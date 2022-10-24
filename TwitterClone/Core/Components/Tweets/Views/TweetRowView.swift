//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/20/22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            // profile image & user info & tweet
            if let user = viewModel.tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    // User info & Caption
                    VStack(alignment: .leading, spacing: 4) {
                        // User info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        // Tweet Caption
                        Text(viewModel.tweet.caption).font(.subheadline).multilineTextAlignment(.leading)
                        
                    }
                }
            }
            
            // Action Buttons!
            HStack {
                Button {
                    // Action goes here
                } label: {
                    Image(systemName: "bubble.left").font(.subheadline)
                }
                Spacer()
                
                Button {
                    // Action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath").font(.subheadline)
                }
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill": "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                Spacer()
                
                Button {
                    // Action goes here
                } label: {
                    Image(systemName: "bookmark").font(.subheadline)
                }
            }.padding().foregroundColor(.gray)
            Divider()
        }
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView(tweet: MOCK_TWEET)
//    }
//}
