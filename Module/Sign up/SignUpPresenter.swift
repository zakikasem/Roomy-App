//
//  SignUpPresenter.swift
//  Roomy
//
//  Created by zaki kasem on 12/21/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import Foundation

protocol SignUpPresenter {
    var signUpView:SignUpView! { get set }
    func signUp(name:String,email:String,password:String)
}
class signUpPresenterImplementation:SignUpPresenter {
    
    init (signUpView:SignUpView , router : SignUpRouter ){
           self.signUpView = signUpView
           self.router = router
       }
    
    weak var signUpView: SignUpView!
    var router : SignUpRouter!
    
    func signUp(name:String,email: String, password: String) {
        NetworkManager.signUp(name: name, email: email, password: password) { (responseServer,Error) in
            guard let ServerResponse = responseServer else {return}
            if ServerResponse.message == "Account created successfully" {
                self.signUpView?.hideIndicator()
                self.router.showAlert()
            }
            else {
                return
            }
        }
    }
    
    
}
