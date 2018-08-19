//
//  LocalStorage.swift
//  SpiroAppNew
//
//  Created by Babchenko Alexander on 19.08.2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import Foundation

class LocalStorage {
    
    /// The name of the keys on which the data is stored in UserDefaults
    private struct Keys {
        static let allergies = "allergies"
    }
    
    // MARK: Allergies
    
    static func loadАllergies() -> [String] {
        return UserDefaults.standard.object(forKey: Keys.allergies) as? [String] ?? [String]()
    }
    
    static func saveAllergies(allergies: [String]) {
        UserDefaults.standard.set(allergies, forKey: Keys.allergies)
        UserDefaults.standard.synchronize()
    }
}
