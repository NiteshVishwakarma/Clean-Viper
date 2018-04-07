//
//  LandingScreenWorker.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import RxSwift
//MARK : LandingScreenWorkerInput Protocols
protocol LandingScreenWorkerInput {
    func performMoviesListFetch() -> Observable<[MovieMapper]>
    
}

class LandingScreenWorker : LandingScreenWorkerInput
{
    //MARK : Variables
    var interactor : LandingScreenInteractor!
    
    //MARK : Conforming to LandingScreenWorkerInput Protocols
    func performMoviesListFetch() -> Observable<[MovieMapper]>
    {
        //send key to interactor
        let movieListUseCase = MovieListUseCaseImpl().getMovieList()
        return movieListUseCase
    }
    
    
}
