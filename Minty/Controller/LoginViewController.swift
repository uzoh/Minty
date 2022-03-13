//
//  ViewController.swift
//  Minty
//
//  Created by Uzoh Okwara on 11/03/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordVisibilityImageView: UIImageView!
    @IBOutlet weak var rememberMeImageView: UIImageView!
    @IBOutlet weak var rememberMeLbl: UILabel!
    
    private var passwordVisible = false
    private var rememberMe = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupPasswordVisibility()
        setupRememberMe()
    }
    
    private func setupPasswordVisibility() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.togglePasswordVisibility))
        passwordVisibilityImageView.isUserInteractionEnabled = true
        passwordVisibilityImageView.addGestureRecognizer(tap)
    }
    
    @objc private func togglePasswordVisibility() {
        passwordVisible.toggle()
        passwordVisibilityImageView.image = passwordVisible ? #imageLiteral(resourceName: "NoEye") : #imageLiteral(resourceName: "eye")
        passwordTextField.isSecureTextEntry = !passwordVisible
    }
    
    private func setupRememberMe() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.toggleRememberMe))
        rememberMeImageView.isUserInteractionEnabled = true
        rememberMeImageView.addGestureRecognizer(tap)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.toggleRememberMe))
        rememberMeLbl.isUserInteractionEnabled = true
        rememberMeLbl.addGestureRecognizer(tap2)
    }
    
    @objc private func toggleRememberMe() {
        rememberMe.toggle()
        rememberMeImageView.image = rememberMe ? #imageLiteral(resourceName: "checkbox") : #imageLiteral(resourceName: "uncheckedbox")
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let phone = phoneField.text,
              let password = passwordTextField.text else { return }
        if let error = FormValidator.validPhone(phone) {
            // show error
            return
        }
        
        if let error = FormValidator.validPassword(password) {
            // show error
            return
        }
        
        login(phone: phone, password: password)
    }
    
    private func login(phone: String, password: String) {
        NetworkService.shared.login(phone: phone, password: password) { [weak self] success in
            if success {
                if self?.rememberMe ?? false {
                    UserDefaults.standard.set(phone, forKey: "loggedInUser")
                    UserDefaults.standard.synchronize()
                }
                self?.goToDashboard()
            } else {
                // show error
            }
        }
    }
    
    private func goToDashboard() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
}
