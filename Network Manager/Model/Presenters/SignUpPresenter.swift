//
//  SignUpPresenter.swift
//  Roomy
//
//  Created by zaki kasem on 12/21/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import Foundation

protocol SignUpPresenter {
    var signUpView:signUpView? { get set }
    func signUp(name:String,email:String,password:String)
}
class signUpPresenterImplementation:SignUpPresenter {
    weak var signUpView: signUpView?
    weak var loginView:LoginView?
    func signUp(name:String,email: String, password: String) {
        NetworkManager.signUp(name: name, email: email, password: password) { (responseServer,Error) in
            guard let ServerResponse = responseServer else {return}
            if ServerResponse.message == "Account created successfully" {
                self.signUpView?.hideIndicator()
                self.signUpView?.showAlert()
            }
            else {
                return
            }
        }
    }
    
    
}
