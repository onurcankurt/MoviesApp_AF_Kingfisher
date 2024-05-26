//
//  Movie.swift
//  MoviesApp_AF_Kingfisher
//
//  Created by onur on 26.05.2024.
//

import Foundation

class Movie: Codable {
    var id: Int?
    var ad: String?
    var resim: String?
    var fiyat: Int?
    
    init() {
    }
    
    init(id: Int, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}
