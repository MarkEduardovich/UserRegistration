//
//  ViewController.swift
//  UserRegistration
//
//  Created by Mark on 04.02.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Private properties
    private let user = "User"
    private let password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        passwordTextField.delegate = self
//        passwordTextField.isSecureTextEntry = true

    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SecondViewController
        destinationVC.textAaViewContr = user
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let destinationVC = segue.destination as? SecondViewController else { return }
//        destinationVC.textAaViewContr = userNameTextField.text
//    }
    
    //MARK: - IBActions
    @IBAction func logInButton() {
        if userNameTextField.text != user || passwordTextField.text != password {
            showAlert(title: "Invalid login or password",
                      message: "Pleasw enter correct login and password",
                      textField: passwordTextField)
            return
        }
            performSegue(withIdentifier: "goToNext", sender: nil)
    }
    
    @IBAction func unwindSegueToViewController(segue: UIStoryboardSegue) {
//         guard segue.identifier == "unwindSegue" else { return }
        
        userNameTextField.text = nil
        passwordTextField.text = nil
             
    }
    
    @IBAction func userNameButton(_ sender: Any) {
        showAlert(title: "Oops!", message: "Your name is \(user)😜")
    }
    
    @IBAction func passwordButton(_ sender: Any) {
        showAlert(title: "Oops", message: "Your password is \(password)😄")
    }
    
}

//MARK: - Alert controller
extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - Work with keyboard
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

