//
//  DetalleMovie.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 09/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import MobilePlayer
import AVFoundation
import MediaPlayer
import AudioToolbox

class DetalleMovie: UIViewController {
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var detalleMovie: UITextView!
    @IBOutlet weak var titleMoview: UILabel!
    var movie = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDetaill(movie: movie)
    }
    @IBAction func regresar(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playTrailer(_ sender: Any) {
        self.playTrailerWithURL(url: "https://www.youtube.com/watch?reload=9&v=wJbudwIF0cE#action=share", name: self.movie.original_title)
    }
    func playTrailerWithURL(url: String , name: String) {
        guard let urlVideo = URL(string: url) else { return }
        let playerVC = MobilePlayerViewController(contentURL: urlVideo as URL)
        playerVC.title = "IOS APP - \(name)"
        playerVC.activityItems = [url]
       self.presentMoviePlayerViewControllerAnimated(playerVC)
    }
    
    func setDetaill(movie: Movie){
        titleMoview.text = movie.original_title
        detalleMovie.text = movie.overview
        imagePoster?.image = UIImage(named: "place_holder_movie")
        let urlimage = Constants.BASE_URL_IMAGEN+movie.poster_path
        if let url = URL(string:urlimage ){
            let resource = ImageResource(downloadURL: url, cacheKey: urlimage)
            imagePoster?.kf.setImage(with: resource,
                                    placeholder: UIImage(named:"place_holder_movie") ,
                                    options: [.transition(.fade(1))],
                                    progressBlock: nil,
                                    completionHandler: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
