//
//  Network Layer.swift
//  Roomy
//
//  Created by zaki kasem on 11/19/19.
//  Copyright © 2019 zaki kasem . All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager{
    static func login (email : String , password : String ,completionHandler : @escaping (serverResponse? , Error? ) -> ()){
        let loginRequest = AuthenticationRouter.login(email: email, password: password)
        AF.request(loginRequest).responseJSON { (response) in
            switch response.result {
            case .success :
                guard let DataResponse = response.data else {return}
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(serverResponse.self, from: DataResponse)
                    completionHandler(data , nil)
                }
                catch{
                    print ("OOPS , An Error Occured : \(error)")
                }
                
            case .failure(let error):
                completionHandler(nil ,error)
                
            }
        }
        
    }
    static func signUp ( name : String , email : String , password : String ,completionHandler : @escaping (serverResponse? , Error? ) -> ()){
            let signUpRequest = AuthenticationRouter.signUp(name: name, email: email, password: password)
            AF.request(signUpRequest).responseJSON { (response) in
                switch response.result {
                case .success :
                    guard let DataResponse = response.data else {return}
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(serverResponse.self, from: DataResponse)
                        completionHandler(data , nil)
                    }
                    catch{
                        print ("OOPS , An Error Occured : \(error)")
                    }
                    
                case .failure(let error):
                    completionHandler(nil ,error)
                    
                }
            }
            
        }


        
        static func roomFetching (completionHandler: @escaping ([RoomData]?,Error?) -> Void){
            guard let url = URL(string: "https://roomy-application.herokuapp.com/rooms") else {return}
            let Token = UserDefaults.standard.value(forKey: "Token") as! String
            let Headers:HTTPHeaders = ["Authorization":Token]
            AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: Headers).responseJSON { (response) in
                print (response)
                switch response.result {
                case .success:
                    guard let DataResponse = response.data else {return}
                    do {
                        let decoder = JSONDecoder()
                        let data = try decoder.decode([RoomData].self, from: DataResponse)
                        completionHandler(data, nil)
                    } catch {
                        print("OOPS , An Error Occured: \(error)")
                    }
                case.failure(let error):
                    completionHandler(nil,error)
                }
                
            }
        }
}
       

