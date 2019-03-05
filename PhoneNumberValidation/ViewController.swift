//
//  ViewController.swift
//  PhoneNumberValidation
//
//  Created by ccc on 20/04/2018.
//  Copyright © 2018 ccc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nrTelefoni: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    @IBAction func butoni(_ sender: Any) {
        
        if (nrTelefoni.text?.isPhone())!
        {
            print("Is Phone Number")
        }
        else{
            print("Is not Phone Number")
        }
    }
}
extension String {
    
    public func isPhone()->Bool {
        if self.isAllDigits() == true {
            let phoneRegex = "[7-9]{1}([0-9]{7})?"
            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return  predicate.evaluate(with: self)
        }else {
            return false
        }
    }
    
    private func isAllDigits()->Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
}

