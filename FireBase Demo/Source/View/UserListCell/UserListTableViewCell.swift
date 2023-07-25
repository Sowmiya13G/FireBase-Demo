//
//  UserListTableViewCell.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 19/07/23.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

   
    @IBOutlet weak var lblForUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
