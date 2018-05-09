//
//  Constants.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 04/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import Foundation

open class Constants {
    public init() {
    }
    open static let apiKey = "8c3995d7c29355fc5942e8b54bcb5ded"
    open static let apiToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzM5OTVkN2MyOTM1NWZjNTk0MmU4YjU0YmNiNWRlZCIsInN1YiI6IjVhZWNkZTc0OTI1MTQxMWQxZTAwMThkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cGqrbarJuQ-mE0N7oeXHlT3V2qwf7nGfCoIR6yASZBo"
    
    open static let BASE_URL = "https://developers.themoviedb.org/"
    open static let BASE_URLACCESS = "https://api.themoviedb.org/"
     open static let BASE_REDIRECT = "http://www.themoviedb.org/"
    open static let CATEGORIES_URL = "lists"
    open static let REQUEST_TOKEN = "4/auth/request_token"
    open static let REQUEST_LIST = "4/list/"
    open static let BASE_URL_IMAGEN = "https://image.tmdb.org/t/p/w370_and_h556_bestv2"

    open static let noInternetConection = NSLocalizedString("No hay conexión a internet.", comment: "cancel")
    open static let generalErrorConection = NSLocalizedString("Ocurrio un problema, intente más tarde.", comment: "cancel")
    open static let timeOut = 30.0

}

