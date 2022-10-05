//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by Christopher Samso on 9/29/22.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return []
        } else {
            let lowecasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowecasedQuery) ||
                $0.fullname.lowercased().contains(lowecasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
    
}
