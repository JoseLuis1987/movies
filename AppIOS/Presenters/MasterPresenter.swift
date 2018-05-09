//
//  MasterPresenter.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 04/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore
import ObjectMapper
import SwiftyJSON
import Alamofire

public protocol URLConvertible {
    func asURL() throws -> URL
}

open class MasterPresenter: NSObject {
    public override init() {
    }
    public static let manager: Alamofire.SessionManager = {
     
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "s-east-1.galaxy-ingress.meteor.com": .disableEvaluation,
            "pi.themoviedb.org": .disableEvaluation,
            "api.themoviedb.org": .disableEvaluation,
            "54.243.33.67": .disableEvaluation,
            "34.194.179.109": .disableEvaluation,
            "52.73.54.96": .disableEvaluation,
            "52.54.235.177.9": .disableEvaluation,
            "54.243.249.125": .disableEvaluation,
            "54.243.102.134": .disableEvaluation,
            "54.235.177.9": .disableEvaluation,
            "54.235.202.27": .disableEvaluation,
            "54.225.136.52": .disableEvaluation,
            "image.tmdb.org": .disableEvaluation,
            "104.16.59.155": .disableEvaluation
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.urlCredentialStorage = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        configuration.timeoutIntervalForRequest = Constants.timeOut
        //        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: MyServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    func errorFromService(with  message: String?, code: Int)->NSError{
        var userInfo: [AnyHashable : Any] =  [:]
        
        if message == nil || message == ""{
            userInfo = [
                NSLocalizedDescriptionKey :  NSLocalizedString("Error", value: "No hay conexión a internet.", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("Error", value: "No hay conexión a internet.", comment: "")
            ]
        }else{
            userInfo = [
                NSLocalizedDescriptionKey :  NSLocalizedString("Error", value: message!, comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("Error", value: message!, comment: "")
            ]
            
        }
        let err = NSError(domain: "responseErrorDomain", code: code, userInfo: userInfo as? [String : Any])
        return err
        
    }
}


open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
    
    open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        return ServerTrustPolicy.disableEvaluation
    }
}

