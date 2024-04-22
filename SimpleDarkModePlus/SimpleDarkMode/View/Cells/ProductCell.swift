//
//  ProductCell.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 9/4/24.
//

import UIKit

class ProductCell: UITableViewCell {

    
    @IBOutlet weak var productImage         : UIImageView!
    @IBOutlet weak var productName          : UILabel!
    @IBOutlet weak var productPrice         : UILabel!
    @IBOutlet weak var productDescription   : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
