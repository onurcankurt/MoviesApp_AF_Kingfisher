//
//  ViewController.swift
//  MoviesApp_AF_Kingfisher
//
//  Created by onur on 26.05.2024.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var moviesList = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
    }
}

extension HomePageVC: CellProtocol{
    func addToCart(indexPath: IndexPath) {
        print("Anasayfa: \(moviesList[indexPath.row].ad!) added to cart.")
    }
}

extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = moviesList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        cell.imageViewCell.image = UIImage(named: movie.resim!)
        cell.priceLabelCell.text = "\(movie.fiyat!) ₺"
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10
        
        return cell
    }
}

