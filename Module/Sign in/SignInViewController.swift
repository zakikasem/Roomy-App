//
//  SignInVC.swift
//  Roomy
//
//  Created by zaki kasem on 10/28/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import UIKit
import Alamofire
protocol LoginView:class {
    //func navigateToHomeVC ()
    func showAlert()
    func hideIndicator()
}
class SignInViewController: UIViewController,LoginView{
   
    
    var GeneratedToken:String = ""
    var presenter:LoginPresenterImplementation!
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
      let Alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var SignInBttn: UIButton!
    @IBOutlet weak var OvalView: UIView!
    @IBOutlet weak var OvalView2: UIView!
    @IBOutlet weak var OvalView3: UIView!
    @IBOutlet weak var OvalView4: UIView!
    @IBOutlet weak var LoginIndicator: UIActivityIndicatorView!
    
    @IBAction func SignUpButtonClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let SignUpViewController = storyBoard.instantiateViewController(identifier: "SignUp") as! SignUpViewController
        self.navigationController?.pushViewController(SignUpViewController, animated: true)
    }
    @IBAction func signInbttn(_ sender: Any) {
        guard let Email = usernameTxtField.text else {return}
        guard let Password = passwordTxtField.text else {return}
        if Email.isEmpty  == false && Password.isEmpty == false {
            LoginIndicator.isHidden = false
            LoginIndicator.startAnimating()
            presenter.login(email: Email, password: Password)
        }
        else {
            return
        }
    }
    override  func viewDidLoad() {
        super.viewDidLoad()
        roundedBttnWithShadow(Bttn: SignInBttn)
        circleOval(viewType: OvalView)
        circleOval(viewType: OvalView2)
        circleOval(viewType: OvalView3)
        circleOval(viewType: OvalView4)
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
       // presenter = LoginPresenterImplementation()
       // presenter.LoginView = self
        let router = LoginRouterImplementation(signInViewController: self)
        presenter = LoginPresenterImplementation(loginView: self, router: router)
        hideIndicator()
    }
    
    
    
    func roundedBttnWithShadow(Bttn: UIButton) {
        Bttn.layer.cornerRadius = Bttn.frame.size.height/2
        Bttn.layer.shadowColor = UIColor.black.cgColor
        Bttn.layer.shadowRadius = 2
        Bttn.layer.shadowOpacity = 0.5
        Bttn.layer.shadowOffset = CGSize(width: 0.0 , height: 2.0)
    }
    func circleOval(viewType: UIView) {
        viewType.backgroundColor = .white
        viewType.layer.cornerRadius = viewType.frame.size.width/2
        viewType.clipsToBounds = true
        viewType.layer.masksToBounds = false
        viewType.layer.shadowColor = UIColor.black.cgColor
        viewType.layer.shadowRadius = 1.0
        viewType.layer.shadowOpacity = 0.5
        viewType.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    //func navigateToHomeVC() {
        //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
       // let homeViewController = storyBoard.instantiateViewController(identifier: "homeVC") as! HomeViewController
       // self.navigationController?.pushViewController(homeViewController, animated: true)
    //}
    
    func showAlert() {
        let Alert = UIAlertController(title: "Wrong data", message: "You have entered wrong username or password", preferredStyle: .alert)
        let Action = UIAlertAction(title: "Ok", style:.default, handler: nil)
        Alert.addAction(Action)
        self.present(Alert,animated: true,completion: nil)
    }
    func hideIndicator () {
        LoginIndicator.isHidden = true

    }

}



