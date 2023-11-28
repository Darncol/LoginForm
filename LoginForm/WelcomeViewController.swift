//
//  WelcomeViewController.swift
//  LoginForm
//
//  Created by Alexey Solop on 28.11.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    var userName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.8, y: 0.8)
        view.layer.insertSublayer(gradient, at: 0)
        
        if let userName = userName {
            WelcomeLabel.text = "Welcome, \(userName)!"
        }
    }
}
