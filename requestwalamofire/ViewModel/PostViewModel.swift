//
//  PostViewModel.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 18.10.24.
//

import Foundation

class PostsViewModel {
    
    var posts: [PostStruct] = []
    var didUpdatePosts: (() -> Void)?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    let manager = PostNetworkManger()
    
    func loadPosts() {

        manager.getPostItems { items, errorString in
            if let errorString {
                self.error?(errorString)
            } else if let items {
                self.posts = items
                self.success?()
            }
        }
    }
}
