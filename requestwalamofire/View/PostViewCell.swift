//
//  PostViewCell.swift
//  requestwalamofire
//
//  Created by Emil Maharramov on 28.10.24.
//

import UIKit

class PostViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionField: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: PostStruct) {
        titleLabel.text = model.title
        descriptionField.text = model.body
    }
}
