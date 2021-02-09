//
//  ViewController.swift
//  Task4
//
//  Created by Denis Larin on 08.02.2021.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var enterLogin: UITextField!
    @IBOutlet var resultCheck: UILabel!
    @IBOutlet var checkLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkLogin() {
    
        guard let login = enterLogin.text else { return }
        
        if login.loginСonditions() {
            resultCheck.text = "Success"
        } else {
            resultCheck.text = "Error"
        }
    }
    
    
}

extension String {
    
    func loginСonditions() -> Bool {
        
        let range = NSRange(location: 0, length: self.count)
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z][a-zA-Z0-9.@-]{2,31}$")
                
        if regex.firstMatch(in: self, options: [], range: range) != nil {
            return true
        } else {
            return false
        }
    }
}

