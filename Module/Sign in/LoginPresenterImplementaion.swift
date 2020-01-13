//
//  LoginPresenterImplementaion.swift
//  Roomy
//
//  Created by zaki kasem on 12/21/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//
import Foundation
protocol LoginPresenter {
    var loginView:LoginView! {get set}
    func login (email:String,password:String)
}
class LoginPresenterImplementation:LoginPresenter {
    var router : LoginRouter!
    weak var loginView: LoginView!
    
    init (loginView : LoginView , router : LoginRouter  ){
        self.loginView = loginView
        self.router = router
        
        
    }
    func login(email: String, password: String) {
        NetworkManager.login(email: email, password: password) { responseServer,Error  in
            guard let ServerResponse = responseServer else {return}
            if ServerResponse.message == "Invalid credentials" {
                self.loginView.showAlert()
                self.loginView.hideIndicator()
            }
            else {
                let Token = ServerResponse.auth_token
                UserDefaults.standard.set(Token, forKey: "Token")
                self.router.navigateToHomeVC()
            }
            
        }
    }
   
}
