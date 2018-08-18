//
//  TableViewControllerAllergyTicker.swift
//  SpiroAppNew
//
//  Created by Melisa Popanicic on 17/08/2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import UIKit

class TableViewControllerAllergyTicker: UITableViewController {
    
    // MARK: Vars
    
    let allergies = ["Æg", "Mælk", "Fisk", "Gluten", "Soja", "Nødder", "Peanuts", "Kød"]
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    // MARK: Actions
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        if (swipe.direction == .down) {
            performSegue(withIdentifier: "goDown", sender: self)
        }
    }
    
    // MARK: UITableView DataSource/Delegates
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergies.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allergyCells = tableView.dequeueReusableCell(withIdentifier: "allergyCells", for: indexPath)
        allergyCells.textLabel?.text = allergies[indexPath.row]
        return allergyCells
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    
}