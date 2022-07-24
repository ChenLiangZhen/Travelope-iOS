//
//  ViewController.swift
//  travelope
//
//  Created by Lightiichen on 2022/7/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.userNameInput.text
    }
    
    var password: String? {
        return loginView.userPasswordInput.text
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController{
    
    private func style(){
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.tintColor = .black
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In with Apple", for: [])
        signInButton.addTarget(self, action: #selector(signInPressed), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.font = .systemFont(ofSize: 14)
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemPink
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
    }
    
    private func layout(){
        
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2.5),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2.5)
            
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 4),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
    }
}

extension LoginViewController{
    
    @objc func signInPressed(sender: UIButton) {
        
        errorMessageLabel.isHidden = false
        login()
    }
    
    private func login() {
        
        print("LOGIN")
        
        guard let username = username , let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            setLoginStatus(withMessage: "Username / Password cannot be blank")
        }
    }
    
    private func setLoginStatus(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

