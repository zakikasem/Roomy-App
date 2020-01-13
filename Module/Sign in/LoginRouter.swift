//
//  LoginRouter.swift
//  Roomy
//
//  Created by zaki kasem on 1/7/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouter {
    func navigateToHomeVC()
}
class LoginRouterImplementation : LoginRouter {
    var signInViewController : SignInViewController!
    init (signInViewController : SignInViewController){
        self.signInViewController = signInViewController
    }
    
    func navigateToHomeVC() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyBoard.instantiateViewController(identifier: "homeVC") as! HomeViewController
        signInViewController.navigationController?.pushViewController(homeViewController, animated: true)
    }
        
    
}
