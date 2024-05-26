//
//  MoviesDaoRepository.swift
//  MoviesApp_AF_Kingfisher
//
//  Created by onur on 26.05.2024.
//

import Foundation
import RxSwift
import Alamofire

class MoviesDaoRepository {
    var movieList = BehaviorSubject<[Movie]>(value: [Movie]())
    
    func uploadMovies(){
        AF.request("http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php", method: .get).response { response in
            if let data = response.data{
                do {
                    let responseJSON = try JSONDecoder().decode(MovieResponse.self, from: data)
                    if let list = responseJSON.filmler{
                        self.movieList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
