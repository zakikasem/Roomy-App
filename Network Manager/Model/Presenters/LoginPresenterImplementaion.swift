//
//  LoginPresenterImplementaion.swift
//  Roomy
//
//  Created by zaki kasem on 12/21/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//
import Foundation
protocol LoginPresenter {
    var LoginView:LoginView! {get set}
    func login (email:String,password:String)
}
class LoginPresenterImplementation:LoginPresenter {
    weak var LoginView: LoginView!
    func login(email: String, password: String) {
        NetworkManager.login(email: email, password: password) { responseServer,Error  in
            guard let ServerResponse = responseServer else {return}
            if ServerResponse.message == "Invalid credentials" {
                self.LoginView.showAlert()
                self.LoginView.hideIndicator()
            }
            else {
                let Token = ServerResponse.auth_token
                UserDefaults.standard.set(Token, forKey: "Token")
                self.LoginView.navigateToHomeVC()
            }
            
        }
    }
   
}
