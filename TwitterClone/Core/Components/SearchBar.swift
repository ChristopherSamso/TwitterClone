//
//  SearchBar.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/30/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("Search...", text: $text).padding(8).padding(.horizontal, 24).background(Color(.systemGray6)).cornerRadius(8).overlay(
                HStack{
                    Image(systemName: "magnifyingglass").foregroundColor(.gray).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(8)
                }
            )
        }.padding(.horizontal, 4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}