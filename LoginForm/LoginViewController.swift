//
//  ViewController.swift
//  LoginForm
//
//  Created by Alexey Solop on 28.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var userLoginTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLoginTextField.delegate = self
        userPasswordTextField.delegate = self
    }
    
    
    @IBAction func loginButtonTapped() {
        performSegue(withIdentifier: SegueIdentifier.login, sender: nil)
    }
    
    @IBAction func remindUserName() {
    }
    
    @IBAction func remindUserPassword() {
    }
    
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userLoginTextField.text = ""
        userPasswordTextField.text = ""
    }
    
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userLoginTextField {
            userPasswordTextField.becomeFirstResponder()
        } else {
            loginButtonTapped()
        }
        return true
    }
    
}
