//
//  PhotoDetail.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 25.10.24.
//

import Foundation

class PhotoDetailViewModel {
    var photodetail: PhotosStruct?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var reloadData: (() -> Void)?
    
    let manager = PhotoNetworkManager()
    
    func loadPhoto(for id: Int) {
        manager.getPhotoById(id: id) { items, errorString in
            if let errorString {
                self.error?(errorString)
            } else if let items {
                self.photodetail = items
                self.reloadData?()
            }
        }
    }
}
