//
//  ViewController.swift
//  UserRegistration
//
//  Created by Mark on 04.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? SecondViewController else { return }
        destinationVC.textAaViewContr = userNameTextField.text
    }
    
    @IBAction func logInButton() {
        guard let firstTF = userNameTextField.text, let secondTF = passwordTextField.text else { return }
        if firstTF.isEmpty || secondTF.isEmpty {
            showAlert(title: "Proverca", message: "Stringa")
        } else {
            if passwordTextField.text == password {
                performSegue(withIdentifier: "goToNext", sender: nil)
            } else {
                showAlert(title: "WORNING!", message: "User name or password invaild")
                passwordTextField.text = "" 
            }
        }
    }
    
    @IBAction func unwindSegueToViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        
        userNameTextField.text = ""
        passwordTextField.text = ""
             
    }
    
    @IBAction func userNameButton(_ sender: Any) {
        showAlert(title: "Oops!", message: "Pleas enter your first name😜")
    }
    
    @IBAction func passwordButton(_ sender: Any) {
        showAlert(title: "Oops", message: "Your password is Password😄")
    }
    
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
    
}

