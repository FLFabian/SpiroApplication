//
//  ViewControllerRestaurants.swift
//  SpiroAppNew
//
//  Created by Melisa Popanicic on 20/08/2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewControllerRestaurants: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewRestaurants: UITableView!
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var restaurantData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewRestaurants.delegate = self
        tableViewRestaurants.dataSource = self
        
        // Set the firebase reference
        ref = Database.database().reference()
        
        // Retrieve the restaurants
        databaseHandle = ref?.child("Restaurants").observe(.childAdded, with: { (snapshot) in
            
            // Try to convert the value f the data to a string
            let restaurant = snapshot.value as? String
            
            if let actualRestaurant = restaurant {
                // Append the data to our restaurantData array
                self.restaurantData.append(actualRestaurant)
                
                // Reload the tableView
                self.tableViewRestaurants.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell")
        cell?.textLabel?.text = restaurantData[indexPath.row]
        
        return cell!
    }

}
