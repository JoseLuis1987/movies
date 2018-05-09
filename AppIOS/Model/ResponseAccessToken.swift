//
//  ResponseAccessToken.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 09/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import Foundation

import ObjectMapper

class ResponseAccessToken: Mappable {
    @objc dynamic var status_code      = 0
    @objc dynamic var status_message     = ""
    @objc dynamic var success   = false
    @objc dynamic var request_token  = ""
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status_code   <- map["status_code"]
        status_message      <- map["status_message"]
        success     <- map["success"]
        request_token  <- map["request_token"]
    }
}
