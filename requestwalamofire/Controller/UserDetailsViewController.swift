//
//  UserDetailsViewController.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 25.10.24.
//

import UIKit

class UserDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = UserDetailViewModel()
    var userId: Int?
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "UserDetailsViewCell", bundle: nil), forCellWithReuseIdentifier: "UserDetailsViewCell")
        
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        if let userId = userId {
            viewModel.loadUser(for: userId)
            self.title = userName
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.userdetail != nil ? 1 : 0 // Tek kullanıcı
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserDetailsViewCell", for: indexPath) as! UserDetailsViewCell
        if let user = viewModel.userdetail {
            cell.configure(with: user)
        }
        return cell
    }
    
}

