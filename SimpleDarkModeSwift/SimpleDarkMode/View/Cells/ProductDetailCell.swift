//
//  ProductCell.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 9/4/24.
//

import UIKit

class ProductDetailCell: UITableViewCell {

    
    @IBOutlet weak var productDetailImage         : UIImageView!
    @IBOutlet weak var productDetailName          : UILabel!
    @IBOutlet weak var productDetailPrice         : UILabel!
    @IBOutlet weak var productDetailDescription   : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confugurationCell(product : Details) {
        
        self.productDetailName.text         = product.name
        self.productDetailImage.image       = UIImage(named: product.imageName ?? "")
        self.productDetailPrice.text        = product.price
        self.productDetailDescription.text  = product.description
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
