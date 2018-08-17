//
//  TableViewControllerAllergyTicker.swift
//  SpiroAppNew
//
//  Created by Melisa Popanicic on 17/08/2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import UIKit

class TableViewControllerAllergyTicker: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


        
        let allergies = ["Æg", "Mælk", "Fisk", "Gluten", "Soja", "Nødder", "Peanuts", "Kød"]
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return allergies.count
            
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let allergyCells = tableView.dequeueReusableCell(withIdentifier: "allergyCells", for: indexPath)
            allergyCells.textLabel?.text = allergies[indexPath.row]
            return allergyCells
            
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
                
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
                
            }
            else {
                
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
                
            }
        }
}//end of TBC class
