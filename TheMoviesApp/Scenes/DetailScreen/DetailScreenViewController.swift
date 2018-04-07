//
//  DetailScreenViewController.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 25/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

protocol DetailScreenViewControllerInput {
    func displayMovieInfo(viewModel : DetailScreen.Movie.ViewModel)
}


class DetailScreenViewController : UIViewController, DetailScreenViewControllerInput
{
    //MARK : Outlet
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieVoteCount: UILabel!
    @IBOutlet weak var movieVoteAverage: UILabel!
    
    
    
    
    //MARK : Variables
    var router: DetailScreenRouterDataPassing!
    var interactor : DetailScreenInteractorInput!
    
    //MARK : Setup Configurator
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    private func setup()
    {
        let viewController = self
        let interactor = DetailScreenInteractor()
        let presenter = DetailScreenPresenter()
        let router = DetailScreenRouter()
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK : Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    func displayData()
    {
        
        let request = DetailScreen.Movie.Request()
        interactor?.dataFromLandingScreen(request: request)
    }
    
    // MARK : Conforming to Input Protocols
    func displayMovieInfo(viewModel: DetailScreen.Movie.ViewModel) {
        moviePoster.sd_setImage(with: URL(string: "http://image.tmdb.org/t/p/w185/\(viewModel.movieData.backdrop_path!)"), placeholderImage: UIImage(named: "placeholder.png"))
        movieTitle.text = viewModel.movieData.title
        movieRelease.text = viewModel.movieData.release_date
        movieOverview.text = viewModel.movieData.overview
        moviePopularity.text = viewModel.movieData.popularity
        movieVoteCount.text = "\(viewModel.movieData.vote_count!)"
        movieVoteAverage.text = viewModel.movieData.vote_average
    }
}
