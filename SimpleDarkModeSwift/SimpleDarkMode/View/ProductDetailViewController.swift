//
//  ProductDetailViewController.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 10/4/24.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView    : UITableView!
    
    var productDetail               : ProductDetail?
    var isWatch                     : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let productCell = tableView.dequeueReusableCell(withIdentifier: "productDetail") as? ProductDetailCell else {
            return UITableViewCell()
        }
        let product = isWatch ? productDetail?.watchs?[indexPath.row] : productDetail?.shoes?[indexPath.row]
        
        productCell.confugurationCell(product: product!)
        
        return productCell
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
