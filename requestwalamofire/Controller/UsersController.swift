//
//  UsersController.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 25.10.24.
//

import UIKit

class UsersController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var userTableView: UITableView!
    
    var users = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        configureViewModel()
    }
    
    func setup() {
        self.title = "Users"
        
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.register(UINib(nibName: "UsersViewCell", bundle: nil), forCellReuseIdentifier: "UsersViewCell")

    }
    
    func configureViewModel() {
        users.loadUsers()
        
        users.error = { [weak self] message in
            self?.showAlert(with: message)
        }
        
        users.success = {
            self.userTableView.reloadData()
        }
        
        users.reloadData = {
            self.userTableView.reloadData()
        }
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersViewCell", for: indexPath) as! UsersViewCell
        let user = self.users.users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userId = users.users[indexPath.row].id
        if let controller = storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController {
            controller.userId = userId
            controller.userName = users.users[indexPath.row].name
            if let navigationController = navigationController {
                navigationController.show(controller, sender: nil)
            } else {
                print("NavigationController is nil")
            }
        } else {
            print("Failed to instantiate CommentController with identifier 'CommentController'")
        }
    }
    
}
