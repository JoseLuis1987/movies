//
//  MovieCell.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 09/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var date_release: UILabel!
    @IBOutlet weak var  originalTitle: UILabel!
    @IBOutlet weak var overView: UITextView!
    @IBOutlet weak var posterPath: UIImageView!
    
   
    func setData(movie: Movie){
        self.contentView.layer.cornerRadius = 3
        self.contentView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        self.contentView.layer.borderWidth = 1
        date_release.text = movie.release_date
        originalTitle.text = movie.original_title
        overView.text = movie.overview
        posterPath?.image = UIImage(named: "place_holder_movie")
        let urlimage = Constants.BASE_URL_IMAGEN+movie.poster_path
        if let url = URL(string:urlimage ){
            let resource = ImageResource(downloadURL: url, cacheKey: urlimage)
            posterPath?.kf.setImage(with: resource,
                                       placeholder: UIImage(named:"place_holder_movie") ,
                                       options: [.transition(.fade(1))],
                                       progressBlock: nil,
                                       completionHandler: nil)
        }
    }
}
