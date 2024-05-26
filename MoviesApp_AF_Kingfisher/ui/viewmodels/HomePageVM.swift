//
//  HomePageVM.swift
//  MoviesApp_AF_Kingfisher
//
//  Created by onur on 26.05.2024.
//

import Foundation
import RxSwift

class HomePageVM {
    var mrepo = MoviesDaoRepository()
    var movieList = BehaviorSubject<[Movie]>(value: [Movie]())
    
    init() {
        movieList = mrepo.movieList
        uploadMovies()
    }
    
    func uploadMovies(){
        mrepo.uploadMovies()
    }
    
    func addToCart(movies: [Movie], indexPath: IndexPath){
        mrepo.addToCart(movies: movies, indexPath: indexPath)
    }
}
