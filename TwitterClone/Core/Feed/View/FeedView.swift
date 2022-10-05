//
//  SwiftUIView.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/20/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TweetsView
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("new_tweet").resizable().frame(width: 28, height: 28).padding()
            }.background(Color(.systemBlue)).foregroundColor(.white).clipShape(Circle()).padding().fullScreenCover(isPresented: $showNewTweetView, onDismiss: {
                viewModel.fetchTweets()
            }) {
                NewTweetView()
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

extension FeedView {
    var TweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets) { tweet in
                    TweetRowView(tweet: tweet).padding()
                }
            }
        }
    }

}
