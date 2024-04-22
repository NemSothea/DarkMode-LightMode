//
//  ExercisesViewController.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 8/4/24.
//

import UIKit

class WatchViewController: UIViewController, UITableViewDelegate , UITableViewDataSource  {
    
    //@IBoutlet
    @IBOutlet weak var tableView : UITableView!
    
    private var watchs = ProductViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "productCell")
        
        self.watchs.loadJson()
        
        navigationItem.title = watchs.product?.categoryWatchName
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  watchs.product?.watchs?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as? ProductCell else {
            return UITableViewCell()
        }
        
        cell.productName.text =  watchs.product?.watchs?[indexPath.row].name
        cell.productImage.image = UIImage(named: watchs.product?.watchs?[indexPath.row].imageName ?? "")
        cell.productPrice.text = watchs.product?.watchs?[indexPath.row].price
        cell.productDescription.text = watchs.product?.watchs?[indexPath.row].description
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else {return}
        vc.productDetail    = watchs.product
        vc.isWatch          = true
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


