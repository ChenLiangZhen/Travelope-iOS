//
//  LoginView.swift
//  travelope
//
//  Created by Lightiichen on 2022/7/24.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let userNameInput = UITextField()
    let userPasswordInput = UITextField()
    
    let stackView = UIStackView()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 200)
//    }
}

extension LoginView {
    
    func style(){
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        userNameInput.translatesAutoresizingMaskIntoConstraints = false
        userNameInput.placeholder = "Username"
        userNameInput.delegate = self
        
        userPasswordInput.translatesAutoresizingMaskIntoConstraints = false
        userPasswordInput.placeholder = "Password"
        userPasswordInput.isSecureTextEntry = true
        userPasswordInput.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 12
        clipsToBounds = true
        
    }
    
    func layout(){
        
        stackView.addArrangedSubview(userNameInput)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(userPasswordInput)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
//            dividerView.heightAnchor.constraint(equalToConstant: 1)
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameInput.endEditing(true)
        userPasswordInput.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
