//
//  AddItemsViewController.swift
//  TodoAppFirebase
//
//  Created by Bilal on 3/17/18.
//  Copyright © 2018 Bilal. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SVProgressHUD

class AddItemsViewController: UIViewController {
    
    var titles = [Titles]()

    @IBOutlet weak var textViewText: UITextView!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func cancelTheAddItemsVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        let titlesDB = Database.database().reference().child("items")
        
        let titleDictionary = ["title": textViewText.text!]
        
        titlesDB.childByAutoId().setValue(titleDictionary) {
            (error, reference) in
            if error != nil{
                print(error!)
            }else {
                print("Msg Saved")

            }
        }
    }
    

    
}
