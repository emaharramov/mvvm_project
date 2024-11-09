//
//  PhotoDetailController.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 25.10.24.
//

import UIKit
import Kingfisher

class PhotoDetailController: UIViewController {
    
    var id: Int?
    var photoName: String?
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var photoDetailImageView: UIImageView!
    
    var viewModel = PhotoDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = photoName
        
        loading.center = view.center
        
        loading.startAnimating()
        
        if let id = id {
            viewModel.loadPhoto(for: id)
            viewModel.reloadData = { [weak self] in
                self?.loadImage(from: self?.viewModel.photodetail?.thumbnailUrl)
            }
        }
    }
    
    func loadImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        
        photoDetailImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder")) { [weak self] _ in
            self?.loading.stopAnimating()
            self?.loading.isHidden = true
        }
    }
}
