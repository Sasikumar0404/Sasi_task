//
//  ApiTableViewCell.swift
//  Sasi task
//
//  Created by Shreedharshan on 31/12/21.
//

import UIKit

class ApiTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var Firstnamelbl: UILabel!
    @IBOutlet weak var lastnamelbl: UILabel!
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
