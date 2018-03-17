//
//  DoThatTableViewController.swift
//  TodoAppFirebase
//
//  Created by Bilal on 3/17/18.
//  Copyright © 2018 Bilal. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DoThatTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
        
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        
        

        return cell
    }

    
    func loadItems() {
        
        Database.database().reference().child("items").observe(.childAdded) { (snapshot) in
            
            
            
        }
    }

}
