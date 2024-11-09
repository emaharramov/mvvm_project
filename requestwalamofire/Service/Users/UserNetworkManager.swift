//
//  UserNetworkManager.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 09.11.24.
//

import Foundation

class UserNetworkManager {
    
    let manager = NetworkManager()
    
    func getAllUsers(completion: @escaping ([UsersStruct]?,
                                          String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .users)
        
        manager.request(model: [UsersStruct].self, url: url) { data, error in
            completion(data, error)
        }
    }
    
    func getUser(id: Int, completion: @escaping (UsersStruct?,
                                                 String?) -> Void) {
        let url = NetworkHelper.shared.url(for: .usersdetail(id: id))
        
        manager.request(model: UsersStruct.self, url: url) { data, error in
            completion(data, error)
        }
    }
    
    
}
