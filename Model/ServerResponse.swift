//
//  ServerResponse.swift
//  Roomy
//
//  Created by zaki kasem on 12/28/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import Foundation

struct serverResponse:Codable {
    let message:String?
    let auth_token:String?
}
