//
//  MovieCell.swift
//  MoviesApp_AF_Kingfisher
//
//  Created by onur on 26.05.2024.
//

import UIKit

protocol CellProtocol {
    func addToCart(indexPath: IndexPath)
}

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var priceLabelCell: UILabel!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    @IBAction func addToCartButton(_ sender: Any) {
        cellProtocol?.addToCart(indexPath: indexPath!)
    }
    
}
