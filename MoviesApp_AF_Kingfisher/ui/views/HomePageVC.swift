//
//  ViewController.swift
//  MoviesApp_AF_Kingfisher
//
//  Created by onur on 26.05.2024.
//

import UIKit
import Kingfisher

class HomePageVC: UIViewController {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var moviesList = [Movie]()
    var viewModel = HomePageVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        
        _ = viewModel.movieList.subscribe(onNext: { movies in
            self.moviesList = movies
            DispatchQueue.main.async {
                self.moviesCollectionView.reloadData()
            }
        })
        
        let design = UICollectionViewFlowLayout()
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumLineSpacing = 10
        design.minimumInteritemSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.65)
        moviesCollectionView.collectionViewLayout = design
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
        
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(movie.resim!)"){
            DispatchQueue.main.async {
                cell.imageViewCell.kf.setImage(with: url)
            }
        }
        
        cell.priceLabelCell.text = "\(movie.fiyat!) ₺"
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10
        
        return cell
    }
}

