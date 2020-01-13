//
//  SignUpRouter.swift
//  Roomy
//
//  Created by zaki kasem on 1/8/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
import UIKit

protocol SignUpRouter {
    func showAlert()
    func navigateToSignInVC()
}

class SignUpRouterImplementation : SignUpRouter {
    var signUpViewController : SignUpViewController!
    init (signUpViewController : SignUpViewController){
        self.signUpViewController = signUpViewController
    }
    
    
    func navigateToSignInVC() {
        signUpViewController.navigationController?.popViewController(animated : true)
    }
    
    
    func showAlert() {
           let Alert = UIAlertController(title: "Successful Operation", message: "Your account has been successfully created!", preferredStyle: .alert)
           let Action = UIAlertAction(title: "Ok", style: .default) { (Action) in
               self.navigateToSignInVC()
           }
        
           Alert.addAction(Action)
           signUpViewController.present(Alert,animated: true,completion: nil)
       }
        
}



