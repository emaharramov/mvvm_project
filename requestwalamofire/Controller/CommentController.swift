//
//  CommentController.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 24.10.24.
//

import UIKit

class CommentController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var id: Int?
    var viewModel = CommentsViewModel()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        if let id = id {
            viewModel.loadComments(for: id)
            self.title = "Comments"
        }
        
        setup()
        configureViewModel()
    }

    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
    }
    
    func configureViewModel() {
        
        viewModel.error = { [weak self] message in
            self?.showAlert(with: message)
        }
        
        viewModel.success = {
            self.tableView.reloadData()
        }
        
        viewModel.didUpdatePosts = {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell else {
            fatalError("The dequeued cell is not an instance of CommentTableViewCell.")
        }
        let comment = viewModel.comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }

    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
