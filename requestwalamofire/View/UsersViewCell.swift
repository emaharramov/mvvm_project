//
//  UsersViewCell.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 25.10.24.
//

import UIKit

class UsersViewCell: UITableViewCell {

    @IBOutlet weak var usernameField: UILabel!
    
    @IBOutlet weak var userMailFIeld: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with user: UsersStruct) {
        usernameField?.text = user.name
        userMailFIeld?.text = user.email
    }
}
