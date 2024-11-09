//
//  CommentsViewModel.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 24.10.24.
//


import Foundation

class CommentsViewModel {
    var comments: [CommentStruct] = []
    var didUpdatePosts: (() -> Void)?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    let manager = CommentNetworkManager()
    
    func loadComments(for postId: Int) {
        
        manager.getCommentById(id: postId) { comments, errorString in
            if let errorString {
                self.error?(errorString)
            } else if let comments {
                self.comments = comments
                self.success?()
            }
        }
    }
}
