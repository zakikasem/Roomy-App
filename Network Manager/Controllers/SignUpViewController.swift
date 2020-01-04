//
//  SignUpViewController.swift
//  Roomy
//
//  Created by zaki kasem on 11/11/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import UIKit
import Alamofire
protocol signUpView:class {
    func navigateToSignInVC()
    func hideIndicator()
    func showAlert()
}
class SignUpViewController: UIViewController,signUpView{
    var presenter:signUpPresenterImplementation!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signUpBttn: UIButton!
    @IBOutlet weak var signUpLoadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let signUp = SignInViewController()
        signUp.roundedBttnWithShadow(Bttn: signUpBttn)
        self.hideKeyboardWhenTappedAround()
        presenter = signUpPresenterImplementation()
        presenter.signUpView = self
        hideIndicator()
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        guard let name = nameLabel.text else {return}
        guard let email = emailLabel.text else {return}
        guard let password = passwordLabel.text else {return}
        if email.isEmpty  == false && password.isEmpty == false && name.isEmpty == false {
            signUpLoadingIndicator.isHidden = false
            signUpLoadingIndicator.startAnimating()
            presenter.signUp(name: name, email: email, password: password)
        }
        else {
            return
        }
    }
    
    func navigateToSignInVC() {
        self.navigationController?.popViewController(animated: true)
    }
    func hideIndicator() {
        signUpLoadingIndicator.isHidden = true
    }
    func showAlert() {
        let Alert = UIAlertController(title: "Successful Operation", message: "Your account has been successfully created!", preferredStyle: .alert)
        let Action = UIAlertAction(title: "Ok", style: .default) { (Action) in
            self.navigateToSignInVC()

        }
        Alert.addAction(Action)
        present(Alert,animated: true,completion: nil)
    }

    
}
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}

