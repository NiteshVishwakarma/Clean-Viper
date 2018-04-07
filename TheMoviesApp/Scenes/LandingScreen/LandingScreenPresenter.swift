//
//  LandingScreenPresenter.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

//MARK : LandingScreenPresenterInput Protocols

protocol LandingScreenPresenterInput {
    func presentMovieList(response : LandingScreen.MovieList.Resposne)
    
}

class LandingScreenPresenter : LandingScreenPresenterInput
{
    
    //MARK : Variables
    var viewcontroller : LandingScreenViewControllerInput!
    
    
    //MARK : Conforming to LandingScreenPresenterInput Protocols
    func presentMovieList(response: LandingScreen.MovieList.Resposne) {
        let viewModel = LandingScreen.MovieList.ViewModel(list: response.list)
        viewcontroller.displayMovieList(viewModel: viewModel)
    }
    
}
