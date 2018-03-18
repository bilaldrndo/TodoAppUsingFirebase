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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
        SVProgressHUD.show()
        
        tableView.separatorStyle = .none
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 75
    }

    func loadItems() {
        
        let titlesDB = Database.database().reference().child("items")
        
        titlesDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["title"]!
            
            let title = Titles()
            title.titles = text
            
            self.titl.append(title)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            self.configureTableView()
            
            SVProgressHUD.dismiss()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        titl.remove(at: indexPath.row)
        self.tableView.reloadData()
    
    }
        
}















