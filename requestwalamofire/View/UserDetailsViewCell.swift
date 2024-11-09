//
//  UserDetailsViewCell.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 25.10.24.
//

import UIKit

class UserDetailsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phonoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with user: UsersStruct) {
        nameLabel.text = "Username: \(user.username ?? "Not Found Username")"
        emailLabel.text = "Email: \(user.email ?? "Not Found Email")"
        phonoLabel.text = "Phone: \(user.phone ?? "Not Found Phone")"
        companyLabel.text = "Company: \(user.company?.name ?? "Not Found Company")"
        adressLabel.text = "Address: \(user.address?.city ?? "Not Found City"), \(user.address?.street ?? "Not Found Street"), \(user.address?.zipcode ?? "Not Found Zipcode")"
    }
}
