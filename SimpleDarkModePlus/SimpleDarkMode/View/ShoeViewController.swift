//
//  MoreViewController.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 8/4/24.
//

import UIKit
import SwiftUI

class ShoeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    //@IBoutlet
    @IBOutlet weak var tableView : UITableView!
    
    var shoes       = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productCell")
        
        self.shoes.loadJson()
        
        navigationItem.title = shoes.product?.categoryShoeName
        
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoes.product?.shoes?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as? ProductCell else {
            return UITableViewCell()
        }
        
        cell.productName.text = shoes.product?.shoes?[indexPath.row].name
        cell.productImage.image = UIImage(named: shoes.product?.shoes?[indexPath.row].imageName ?? "")
        cell.productPrice.text = shoes.product?.shoes?[indexPath.row].price
        cell.productDescription.text = shoes.product?.shoes?[indexPath.row].description
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else {return}
        vc.productDetail    = shoes.product
        self.navigationController?.pushViewController(vc, animated: true)
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
