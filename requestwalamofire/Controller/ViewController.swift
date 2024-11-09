//
//  ViewController.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 18.10.24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var postsViewModel = PostsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureViewModel()
    }
    
    func setup() {
        self.title = "Posts"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PostViewCell", bundle: nil), forCellReuseIdentifier: "PostViewCell")
    }
    
    func configureViewModel() {
        postsViewModel.loadPosts()
        
        postsViewModel.error = { [weak self] message in
            self?.showAlert(with: message)
        }
        
        postsViewModel.success = {
            self.tableView.reloadData()
        }
        
        postsViewModel.didUpdatePosts = {
            self.tableView.reloadData()
        }
    }

    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsViewModel.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostViewCell", for: indexPath) as! PostViewCell
        let post = postsViewModel.posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "CommentController") as? CommentController {
            controller.id = postsViewModel.posts[indexPath.row].id
            navigationController?.show(controller, sender: nil)
        }
    }
}
