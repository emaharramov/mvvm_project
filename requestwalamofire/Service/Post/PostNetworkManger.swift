//
//  PostNetworkManger.swift
//  requestwalamofire
//
//  Created by Samxal Quliyev  on 05.11.24.
//

import Foundation

class PostNetworkManger {
    let manager = NetworkManager()
    
    func getPostItems(completion: @escaping ([PostStruct]?, String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .posts)
        manager.request(model: [PostStruct].self,
                        url: url) { data, error in
            completion(data, error)
        }
    }
}
