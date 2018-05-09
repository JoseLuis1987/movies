//
//  CategoriasPresenter.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 04/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import UIKit
import QuartzCore
import ObjectMapper
import SwiftyJSON
import Alamofire
import KeychainSwift
enum SortTo : Int {
    case Release_dateasc;
    case Release_datedesc;
    case TilteAsc;
    case TilteDesc;
    case Vote_averageasc;
    case Vote_averagedesc;
    var description: String {
        switch self {
        case .Release_dateasc: return "release_date.asc"
        case .Release_datedesc: return "release_date.desc"
        case .TilteAsc: return "title.asc"
        case .TilteDesc: return "title.desc"
        case .Vote_averageasc: return "vote_average.asc"
        case .Vote_averagedesc: return "vote_average.desc"
        }
    }
}
open class CategoriasPresenter: MasterPresenter {
  public override init() {}
    
    func gotoAccessToken(apiKey:String,accessToken:String, completion:@escaping (ResponseAccessToken?,NSError?) -> ()){
        let headers : HTTPHeaders = ["Content-Type":"application/json;charset=utf-8",
                                     "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzM5OTVkN2MyOTM1NWZjNTk0MmU4YjU0YmNiNWRlZCIsInN1YiI6IjVhZWNkZTc0OTI1MTQxMWQxZTAwMThkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cGqrbarJuQ-mE0N7oeXHlT3V2qwf7nGfCoIR6yASZBo"]
        
        let parameters = ["redirect_to": Constants.BASE_REDIRECT]
        let url = Constants.BASE_URLACCESS + Constants.REQUEST_TOKEN
        let urlw = URL(string: url)
        CategoriasPresenter.manager.request(urlw!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { (dataResponse) in
            switch dataResponse.result{
            case .success:
                switch dataResponse.response?.statusCode{
                case 200?:
                    do {
                        let jsonResponse = try JSON(data:dataResponse.data!)
                        if jsonResponse != JSON.null{
                            let responseAccesToken = Mapper<ResponseAccessToken>().map(JSONString: jsonResponse.rawString(String.Encoding.utf8, options: .prettyPrinted)!)
                            completion(responseAccesToken, nil)

                        }
                    }
                    catch {
                        print("Data could not be parsed");
                        completion(nil,self.errorFromService(with: Constants.generalErrorConection, code: 100))
                    }
                    break
                    
                default:
                    print("code different from 200");
                    completion(nil,self.errorFromService(with: Constants.generalErrorConection, code: 100))
                    break
                }
                break
            case .failure(let error):
                print(error)
                print("General Error");
                completion(nil,self.errorFromService(with: Constants.generalErrorConection, code: 100))
                break
            }
            
        }

    }
    
    func getListMovies(listid:String,page:String ,apiKey: String , lenguage: String ,sortBy:SortTo, completion:@escaping (RespuestaGetList?,NSError?) -> ()){
        var setidList = ""
        if listid != nil {
            setidList = ""+listid+"?"
        }
        var setpage = ""
        if page != nil {
            setpage = "page="+page
        }
        var setapi = ""
        if apiKey != nil{
            setapi = "&api_key="+apiKey
        }
        var setlenguage = ""
        if lenguage != nil{
            setlenguage = "&language="+lenguage
        }
        var setSortTo = ""
        if sortBy != nil{
            setSortTo = "&sort_by="+sortBy.description
        }
        
        let url = Constants.BASE_URLACCESS + Constants.REQUEST_LIST+setidList+setpage+setapi+setlenguage+setSortTo
        let urlw = URL(string: url)
        let headers : HTTPHeaders = ["Content-Type":"application/json;charset=utf-8",
                                     "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzM5OTVkN2MyOTM1NWZjNTk0MmU4YjU0YmNiNWRlZCIsInN1YiI6IjVhZWNkZTc0OTI1MTQxMWQxZTAwMThkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cGqrbarJuQ-mE0N7oeXHlT3V2qwf7nGfCoIR6yASZBo"]
        
  // GET
        CategoriasPresenter.manager.request(urlw!, method: .get, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseData { (dataResponse) in
            switch dataResponse.result{
            case .success:
                switch dataResponse.response?.statusCode{
                case 200?:
                    do {
                        let jsonResponse = try JSON(data:dataResponse.data!)
                        if jsonResponse != JSON.null{
                            let respuestaGetList = Mapper<RespuestaGetList>().map(JSONString: jsonResponse.rawString(String.Encoding.utf8, options: .prettyPrinted)!)
                            completion(respuestaGetList, nil)
                        }
                    }
                    catch {
                        print("Data could not be parsed");
                        completion(nil,self.errorFromService(with: Constants.generalErrorConection, code: 100))
                    }
                    break
                default:
                    print("code different from 200");
                    completion(nil,self.errorFromService(with: Constants.generalErrorConection, code: 100))
                    break
                }
                break
            case .failure(let error):
                print(error)
                print("General Error");
                completion(nil,self.errorFromService(with: Constants.generalErrorConection, code: 100))
                break
            }
            
        }

        
        
        
    }
}
