//
//  AddItemsViewController.swift
//  TodoAppFirebase
//
//  Created by Bilal on 3/17/18.
//  Copyright © 2018 Bilal. All rights reserved.
//

import UIKit
import FirebaseDatabase

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
    
        ref = Database.database().reference()
        let itemReference = ref?.child("items")

        if textViewText.text != "" {
    
            itemReference?.setValue(["item": textViewText.text!])
            
        }else {
            
            print("Need to Put Character")
            
        }
        
    }
}
