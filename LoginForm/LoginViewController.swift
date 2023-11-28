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
    
    private let user = "1"
    private let password = "2"
    
    @IBAction func remindUserName() {
        showAlert("User name is:", "1")
    }
    
    @IBAction func remindUserPassword() {
        showAlert("User password is:", "2")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userLoginTextField.text = ""
        userPasswordTextField.text = ""
    }
}

// MARK: - UserInteraction
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func showAlert(
        _ title: String,
        _ message: String,
        onOk: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            onOk?()
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

// MARK: - SegueManagement
extension LoginViewController {
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard  userLoginTextField.text == user,
               userPasswordTextField.text == password
        else {
            showAlert("whoops", "Invalid login or password") {
                self.userPasswordTextField.text = ""
            }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "welcomeScreen",
              let destinationVC = segue.destination as? WelcomeViewController
        else { return }
        destinationVC.userName = userLoginTextField.text
    }
}
