//
//  AuthRouter.swift
//  Roomy
//
//  Created by zaki kasem on 11/19/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import Foundation
import Alamofire

enum AuthenticationRouter : URLRequestConvertible {
    case login (email :String , password : String )
    case signUp (name : String , email : String , password: String)
    case roomFetching
    
    func asURLRequest() throws -> URLRequest {
        let url : URL = {
            switch self {
             case .login:
                           return URL(string:"https://roomy-application.herokuapp.com/auth/login")!
                       case .signUp:
                           return URL(string:"https://roomy-application.herokuapp.com/signup")!
                       case .roomFetching:
                           return URL(string: "https://roomy-application.herokuapp.com/rooms")!
            }
            
        }()
        let parameter: [String:Any]? = {
            switch self {
            case .login(let email, let password):
                return ["email": email , "password": password]

            case .signUp(let name, let email, let password):
                return ["name": name , "email": email , "password": password]
            case .roomFetching:
                return nil
            }
            
        }()
        let method: HTTPMethod = {
            switch self {
            case .login , .signUp:
                return .post
            case .roomFetching:
                return .get
            }

        }()
        let urlRequest = try! URLRequest( url : url , method : method)
        
        let encoding:ParameterEncoding = JSONEncoding.default
        return try! encoding.encode(urlRequest , with : parameter)
    }

}

