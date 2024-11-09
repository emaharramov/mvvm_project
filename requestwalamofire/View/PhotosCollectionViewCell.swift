//
//  PhotosCollectionViewCell.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 24.10.24.
//

import UIKit
import Kingfisher

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoTitleField: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func configure(with photo: PhotosStruct) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false

        if let urlString = photo.url, let url = URL(string: urlString) {
            photoTitleField.text = photo.title
            imageView.kf.setImage(with: url, placeholder: UIImage(named: "Image: \(String(describing: photo.title))")) { [weak self] _ in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        }
    }
}
