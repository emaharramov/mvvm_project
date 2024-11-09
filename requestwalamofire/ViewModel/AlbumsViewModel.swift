//
//  AlbumsViewModel.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 24.10.24.
//

import Foundation

class AlbumsViewModel {
    
    var album: [AlbumStruct] = []
    var didUpdateAlbums: (() -> Void)?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    let manager = AlbumNetworkManager()
    
    func loadAlbums() {
        manager.getAlbumItems { items, errorString in
            if let errorString {
                self.error?(errorString)
            } else if let items {
                self.album = items
                self.success?()
            }
        }
    }
}
