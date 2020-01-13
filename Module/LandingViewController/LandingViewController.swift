//
//  ViewController.swift
//  Roomy
//
//  Created by zaki kasem on 10/28/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func StartButtonAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = storyBoard.instantiateViewController(identifier: "SignIn") as! SignInViewController
        navigationController?.pushViewController(signInViewController, animated: true)
    }
    

}

