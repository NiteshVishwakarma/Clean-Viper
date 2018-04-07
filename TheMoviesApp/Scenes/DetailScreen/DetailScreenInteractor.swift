//
//  DetailScreenInteractor.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 26/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

protocol DetailScreenInteractorInput {
    func dataFromLandingScreen(request : DetailScreen.Movie.Request)
}
protocol DetailScreenDataSource
{
    var movies: MovieMapper? { get set }
}

class DetailScreenInteractor : DetailScreenDataSource, DetailScreenInteractorInput
{
    // Mark : Variables
    var presenter : DetailScreenPresenterInput!
    var movies: MovieMapper?

    // MARK : Conforming to Input Protocols
    func dataFromLandingScreen(request : DetailScreen.Movie.Request) {
        let response = DetailScreen.Movie.Resposne(movieData:(movies)! )
        presenter.presentMovieData(response: response)
        
    }
    
}
