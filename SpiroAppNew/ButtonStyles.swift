//
//  ButtonStyles.swift
//  SpiroAppNew
//
//  Created by Melisa Popanicic on 14/08/2018.
//  Copyright © 2018 Papuchinos. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1/UIScreen.main.nativeScale
        layer.borderColor = UIColor.orange.cgColor
        layer.cornerRadius = frame.height/4
        //contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
    }
}

