//
//  PhotosViewModel.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 24.10.24.
//


import Foundation

class PhotosViewModel {
    var photos: [PhotosStruct] = []
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var reloadData: (() -> Void)?
    
    let manager = PhotoNetworkManager()
    
    func loadPhotos() {
        
        manager.getPhotoItems{ items, errorString in
            if let errorString {
                self.error?(errorString)
            } else if let items {
                self.photos = items
                self.success?()
            }
        }
    }
}
