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
    var selectedAllergies: [String] = []
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Load from LocalStorage
        self.selectedAllergies = LocalStorage.loadАllergies()
    }
    
    // MARK: Actions
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        if (swipe.direction == .down) {
            performSegue(withIdentifier: "goDown", sender: self)
        }
    }
    
    // MARK: UITableView DataSource/Delegates
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allergies.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allergyCells = tableView.dequeueReusableCell(withIdentifier: "allergyCells", for: indexPath)
        let allergy = self.allergies[indexPath.row]
        allergyCells.textLabel?.text = allergy
        allergyCells.accessoryType = self.selectedAllergies.contains(allergy) ? UITableViewCellAccessoryType.checkmark: UITableViewCellAccessoryType.none
        return allergyCells
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let allergy = self.allergies[indexPath.row]
        
        if let index = self.selectedAllergies.index(of: allergy) {
            self.selectedAllergies.remove(at: index)
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            self.selectedAllergies.append(allergy)
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
        // Save to LocalStorage
        LocalStorage.saveAllergies(allergies: self.selectedAllergies)
    }
    
    
}
