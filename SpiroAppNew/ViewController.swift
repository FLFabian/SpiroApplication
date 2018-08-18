//
//  ViewController.swift
//  SpiroAppNew
//
//  Created by Papuchino on 25/05/2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txtPostnummer: UITextField!
    @IBAction func txtPostnummerLength(_ sender: UITextField) {
        maxLength(textFieldName: txtPostnummer, max4: 4)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.txtPostnummer.delegate = self;
        //Only allow numberpad
        txtPostnummer.keyboardType = UIKeyboardType.numberPad
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   // START txtPostnummer input field validation
    
    // Only allow numrical values input (Redundent now as numberpad keyboard only comes up)
    /*func textField(_ textFieldPostnummer: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }*/
    
    // Hide keyboard when user touches outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // Hide also numpad when user presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtPostnummer.resignFirstResponder()
        return (true)
    }
    
    func maxLength (textFieldName: UITextField, max4:Int){
    let length = textFieldName.text?.count
    let metin = textFieldName.text
        
        if (length! > max4)
        {
            let index = metin?.index((metin?.startIndex)!, offsetBy: max4)
            textFieldName.text = textFieldName.text?.substring(to: index!)
        }
    }
    
    // END txtPostnummer input field validation
    
    // Class for styling buttons
    class RoundedButton: UIButton {
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            layer.borderWidth = 1/UIScreen.main.nativeScale
            layer.borderColor = UIColor.orange.cgColor
            layer.cornerRadius = frame.height/4
            contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
}
