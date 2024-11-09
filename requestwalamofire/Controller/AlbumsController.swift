//
//  AlbumsController.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 24.10.24.
//

import UIKit

class AlbumsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = AlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureViewModel()
    }
    
    func setup() {
        self.title = "Albums"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureViewModel() {
        
        viewModel.loadAlbums()
        
        viewModel.error = { [weak self] message in
            self?.showAlert(with: message)
        }
        
        viewModel.success = {
            self.tableView.reloadData()
        }
        
        viewModel.didUpdateAlbums = {
            self.tableView.reloadData()
        }
    }

    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.album.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        let album = viewModel.album[indexPath.row]
        cell.textLabel?.text = album.title
        return cell
    }
}


