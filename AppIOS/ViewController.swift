//
//  ViewController.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 04/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    var movies: [Movie] = []
    @IBOutlet weak var collectionMovies: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getAccess()
        self.getCategories()
        collectionMovies.dataSource = self
        collectionMovies.delegate = self
    }
  
    func getAccess(){
        self.showHUD()
        CategoriasPresenter().gotoAccessToken(apiKey: Constants.apiKey, accessToken: Constants.apiToken) { (accessToken, error) in
            if error != nil{
                  self.hideHUD()
            }else{
                  self.hideHUD()
                if accessToken != nil {
                    let keyChain = KeychainSwift()
                    keyChain.set((accessToken?.request_token)!, forKey: "request_token")
                }
            }
        }
    }
    
    func getCategories() {
          self.showHUD()
         CategoriasPresenter().getListMovies(listid: "1", page: "1", apiKey: Constants.apiKey, lenguage: "es", sortBy: SortTo.Vote_averagedesc){ (respuestaList, error) in
            if error != nil{
                print(error!)
                self.hideHUD()
            }else{
                if respuestaList != nil {
                    self.hideHUD()
                    self.movies = (respuestaList?.results)!
                    if self.movies.count > 0 {
                        self.collectionMovies.reloadData()
                    }
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

