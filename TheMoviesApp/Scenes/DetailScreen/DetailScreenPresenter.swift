//
//  DetailScreenPresenter.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 26/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation

protocol DetailScreenPresenterInput {
    func presentMovieData(response : DetailScreen.Movie.Resposne)
}

class DetailScreenPresenter : DetailScreenPresenterInput
{
    var viewController : DetailScreenViewControllerInput!
    
    // MARK : Conforming to Input protocol
    func presentMovieData(response: DetailScreen.Movie.Resposne) {
        let viewModel = DetailScreen.Movie.ViewModel(movieData : response.movieData)
        viewController?.displayMovieInfo(viewModel: viewModel)
    }
    
    
}
