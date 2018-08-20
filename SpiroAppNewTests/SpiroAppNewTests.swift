//
//  SpiroAppNewTests.swift
//  SpiroAppNewTests
//
//  Created by Papuchino on 25/05/2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import XCTest
@testable import SpiroAppNew

class SpiroAppNewTests: XCTestCase {
    
    //Testing allergies spelled correct
    var viewController = TableViewControllerAllergyTicker()
    func testSometing() {
        let input = ["Æg", "Mælk", "Fisk", "Gluten", "Soja", "Nødder", "Peanuts", "Kød"]
        XCTAssertEqual(self.viewController.allergies, input)
    }
}
