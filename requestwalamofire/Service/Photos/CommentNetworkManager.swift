//
//  CommentNetworkManager.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 09.11.24.
//

import Foundation

class CommentNetworkManager {
    let manager = NetworkManager()
    
    func getCommentById(id: Int, completion: @escaping ([CommentStruct]?, String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .comments(postId: id))
        manager.request(model: [CommentStruct].self, url: url) {data, error in
            completion(data,error)}
    }
    
}
