//
//  Movies.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 09/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import Foundation
import ObjectMapper

class RespuestaGetList: Mappable {
      @objc dynamic var iso_639_1     = ""
      @objc dynamic var id    = 0
      @objc dynamic var page      = 0
      @objc dynamic var iso_3166_1     = ""
      @objc dynamic var total_results      = 0
      @objc dynamic var object_ids     = 0
      @objc dynamic var name     = ""
      @objc dynamic var publi    = false
      @objc dynamic var comments     = ""
      @objc dynamic var sort_by     = ""
      @objc dynamic var description     = ""
      @objc dynamic var backdrop_path     = ""
      @objc dynamic var average_rating     = 0.0
      @objc dynamic var runtime     = ""
      @objc dynamic var created_by     = 0.0
      @objc dynamic var poster_path     = ""
        var results: [Movie]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
         iso_639_1  <- map["iso_639_1"]
         id <- map["id"]
         page   <- map["page"]
         iso_3166_1 <- map["iso_3166_1"]
         total_results <- map["total_results"]
         object_ids <- map["object_ids"]
         name  <- map["name"]
         publi <- map["public"]
         comments <- map["comments"]
         sort_by <- map["sort_by"]
         description <- map["description"]
         backdrop_path  <- map["backdrop_path"]
         results  <- map["results"]
         average_rating <- map["average_rating"]
         runtime  <- map["runtime"]
         created_by <- map["created_by"]
         poster_path  <- map["poster_path"]
        
    }
}
class Movie: Mappable {
    @objc dynamic var vote_average     = 0.0
    @objc dynamic var vote_count    = 0
    @objc dynamic var video    = false
    @objc dynamic var media_type  = ""
    @objc dynamic var title  = ""
    @objc dynamic var popularity     = 0.0
    @objc dynamic var poster_path    = ""
    @objc dynamic var original_language  = ""
    @objc dynamic var original_title     = ""
    @objc dynamic var backdrop_path     = ""
    @objc dynamic var adult    = false
    @objc dynamic var overview     = ""
    @objc dynamic var release_date     = ""
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        vote_average  <- map["vote_average"]
        vote_count <- map["vote_count"]
        video   <- map["video"]
        media_type <- map["media_type"]
        title <- map["title"]
        popularity <- map["popularity"]
        poster_path  <- map["poster_path"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        backdrop_path <- map["backdrop_path"]
        backdrop_path  <- map["backdrop_path"]
        adult  <- map["adult"]
        overview <- map["overview"]
        release_date <- map["release_date"]
    }
}



