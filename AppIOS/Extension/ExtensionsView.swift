//
//  ExtensionsView.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 09/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
// MARK: - UICollectionViewDataSource protocol
extension UIViewController {
    func showHUD() {
        HUD.show(.progress)
       
    }
    func hideHUD() {
        HUD.hide()
    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        cell.tag = indexPath.row
        let movie: Movie = movies[indexPath.row]
        cell.setData(movie: movie)
        return cell
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (self.view.frame.size.width - 12 * 2) / 2 //some width
        let height = width * 0.75 //ratio
        return CGSize(width: width, height: height);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movie: Movie = movies[indexPath.row]
        
        //get the post
        var detalleMovie = Movie()
        detalleMovie = movies[indexPath.row] as! Movie
        // Instantiate SecondViewController
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DetalleMovie") as! DetalleMovie
        viewController.movie = detalleMovie
        viewController.modalPresentationStyle = .popover
        self.navigationController?.pushViewController(viewController, animated: true)

    }
}
