//
//  AuthenticationUseCaseImpl.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxAlamofire
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class MovieListUseCaseImpl : MovieListUseCase
{
    func getMovieList() -> Observable<[MovieMapper]> {
        
        return RxAlamofire.json(.get, "https://api.themoviedb.org/3/discover/movie?api_key=8927df47872ec204ef0dec0c28a55cf7&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=")
            .mapObject(type: MovieWrapper.self)
            .debug()
            .map {
                response in
                print("Data response : \(response.toJSON)")
                return response.results!
        }
    }

}
