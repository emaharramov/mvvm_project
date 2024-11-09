//
//  PhotosController.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 24.10.24.
//

import UIKit

class PhotosController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var photosViewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureViewModel()
    }
    
    func setup() {
        self.title = "Photos"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotosCollectionViewCell")
    }
    
    func configureViewModel() {
        photosViewModel.loadPhotos()
        
        photosViewModel.error = { [weak self] message in
            self?.showAlert(with: message)
        }
        
        photosViewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosViewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photosViewModel.photos[indexPath.row]
        cell.configure(with: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoId = photosViewModel.photos[indexPath.row].id
        let photoName = photosViewModel.photos[indexPath.row].title

        if let controller = storyboard?.instantiateViewController(withIdentifier: "PhotoDetailController") as? PhotoDetailController {
            controller.id = photoId
            controller.photoName = photoName
            print(controller.id ?? "not found id", controller.photoName ?? "not found name")
            navigationController?.show(controller, sender: nil)
        } else {
            print("Failed to instantiate PhotoDetailController with identifier 'PhotoDetailController'")
        }
    }
}
