//
//  SecondViewController.swift
//  UserRegistration
//
//  Created by Mark on 04.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var acceptedUserNameLabel: UILabel!
    
    var textAaViewContr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        acceptedUserNameLabel.text = "Welcome: \(textAaViewContr ?? "")"
    }
    
    @IBAction func goOutButton() {
        performSegue(withIdentifier: "unwindSegue" , sender: nil)
    }
    
}
