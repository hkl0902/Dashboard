//
//  MaxTextField.swift
//  Dashboard
//
//  Created by Hyunkyu Lee on 1/13/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import UIKit

class MaxTextField: UITextField, UITextFieldDelegate {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let additionalLength = NSAttributedString(string: string).size().width
        let currentLength = NSAttributedString(string: textField.text ?? "").size().width
        return additionalLength + currentLength < textField.frame.width
    }

}
