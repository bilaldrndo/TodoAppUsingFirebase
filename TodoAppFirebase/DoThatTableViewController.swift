//
//  DoThatTableViewController.swift
//  TodoAppFirebase
//
//  Created by Bilal on 3/17/18.
//  Copyright © 2018 Bilal. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SVProgressHUD

class DoThatTableViewController: UITableViewController {
    
    var titl = [Titles]()
    
    static let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SVProgressHUD.show()
        
        loadItems()
        
    }

    func loadItems() {
        
        Database.database().reference().child("items").observe(.value) { (snapshot) in
            
            if let dict = snapshot.value as? [String: Any]{
                
                let tltText = dict["item"] as! String
                let tlt = Titles(titlesTxt: tltText)
                self.titl.append(tlt)
                
                self.tableView.reloadData()
            }
            
//            SVProgressHUD.dismiss()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titl.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)  as! ItemTableViewCell
        
        cell.titleText.text = titl[indexPath.row].titles
        
        return cell
    }
        
}















