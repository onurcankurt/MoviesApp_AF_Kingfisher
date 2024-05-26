//
//  DetailsVC.swift
//  MoviesApp_AF_Kingfisher
//
//  Created by onur on 26.05.2024.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var detailMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let m = detailMovie{
            nameLabel.text = m.ad
            movieImageView.image = UIImage(named: m.resim!)
            priceLabel.text = "\(m.fiyat!) ₺"
        }
    }
}
