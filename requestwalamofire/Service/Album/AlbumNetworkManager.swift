//
//  AlbumNetworkManager.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 09.11.24.
//

import Foundation

class AlbumNetworkManager: NetworkManager {
    let manager = NetworkManager()
    
    func getAlbumItems(completion: @escaping ([AlbumStruct]?, String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .albums)
        manager.request(model: [AlbumStruct].self, url: url) {data, error in
            completion(data,error)}
    }
    
}
