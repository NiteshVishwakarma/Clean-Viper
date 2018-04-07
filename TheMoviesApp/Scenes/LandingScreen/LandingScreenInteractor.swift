//
//  LandingScreenInteractor.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

// MARK : LandingScreenInteractorInput Protocols
protocol LandingScreenInteractorInput {
    
    func getMoviesList(request : LandingScreen.MovieList.Request)
}
protocol LandingScreenDataSource
{
    var movies: [MovieMapper]? { get set }
}


class LandingScreenInteractor : LandingScreenInteractorInput, LandingScreenDataSource
{
    var movies: [MovieMapper]?
    
    
    //MARK : Variables
    var worker : LandingScreenWorker!
    var presenter : LandingScreenPresenter!
    
    //MARK : Conforming to LandingScreenInteractorInput Protocols
    func getMoviesList(request: LandingScreen.MovieList.Request) {
        worker = LandingScreenWorker()
        worker.performMoviesListFetch()
            .subscribe(onNext:{
                response in
                self.movies = response
                let viewModel = LandingScreen.MovieList.Resposne(list: response)
                self.presenter.presentMovieList(response: viewModel)
            })
    }
    
}
