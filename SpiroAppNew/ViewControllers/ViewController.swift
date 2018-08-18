//
//  ViewController.swift
//  SpiroAppNew
//
//  Created by Papuchino on 25/05/2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    // MARK: Vars
    
    // UI
    @IBOutlet weak var txtPostnummer: UITextField!

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.txtPostnummer.delegate = self;
        //Only allow numberpad
        self.txtPostnummer.keyboardType = UIKeyboardType.numberPad
    }
    
    // MARK: Actions
    
    @IBAction func txtPostnummerLength(_ sender: UITextField) {
        self.maxLength(textFieldName: txtPostnummer, max4: 4)
    }
    
   // START txtPostnummer input field validation
    
    // Only allow numrical values input (Redundent now as numberpad keyboard only comes up)
    /*func textField(_ textFieldPostnummer: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }*/
    
    // MARK: UITouch
    
    // Hide keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: UITextField Delegate
    
    // Hide also numpad when user presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.txtPostnummer.resignFirstResponder()
        return (true)
    }
    
    // MARK: Methods
    
    func maxLength(textFieldName: UITextField, max4:Int) {
        let length = textFieldName.text?.count
        let metin = textFieldName.text
        
        if ((length! > max4) && (metin != nil)) {
            let index = metin?.index((metin?.startIndex)!, offsetBy: max4)
            textFieldName.text = String(metin![..<index!])
        }
    }
    
    // END txtPostnummer input field validation

}
