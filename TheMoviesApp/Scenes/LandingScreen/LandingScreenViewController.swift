//
//  LandingScreenViewController.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SDWebImage

// MARK : LandingScreenViewControllerInput Protocols
protocol LandingScreenViewControllerInput : class {
    
    func  displayMovieList(viewModel : LandingScreen.MovieList.ViewModel)
}

class LandingScreenViewController : UICollectionViewController,LandingScreenViewControllerInput
{
    //MARK : Outlets
    @IBOutlet var collectionList: UICollectionView!
    
    //MARK : Variables
    var interactor : LandingScreenInteractor!
    var MoviePosterImages = [String]()
    var MoviesPosterTitles = [String]()
    var itemCount = 0
    var router : LandingScreenRouterInput!
    var selectedIndex : Int!
//    var router : (NSObjectProtocol & LandingScreenRouterInput & LandingScreenRouterDataPassing)?
    var selectedCell : UICollectionViewCell!
    //MARK : Setup Configurator
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup()
    {
        let viewController = self
        let interactor = LandingScreenInteractor()
        let presenter = LandingScreenPresenter()
        let router = LandingScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewcontroller = viewController
        router.viewController = viewController
        router.dataStore = interactor
        fetchDataOnLoad()
    }
    
    //MARK : Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    // MARK : Conforming to LandingScreenViewControllerInput Protocols
    
    func displayMovieList(viewModel: LandingScreen.MovieList.ViewModel) {
        //print(" My Movie : \(viewModel.list[2].backdrop_path)")
        
        var tempTitles : [String]
        let tempImages = [String]()
        itemCount = viewModel.list.count
        collectionList.reloadData()
        for i in 0..<viewModel.list.count
        {
            MoviesPosterTitles.append(viewModel.list[i].title!)
            MoviePosterImages.append(viewModel.list[i].poster_path!)
        }
    }
    
    //MARK : OnLoad Functions with the help of interactor operations
    
    func fetchDataOnLoad()
    {
        let request = LandingScreen.MovieList.Request()
        interactor.getMoviesList(request: request)
    }
    
    
    // MARK : UICollectionView Configuration
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LandingScreenCollectionViewCell
        cell.MovieTitle.text = MoviesPosterTitles[indexPath.row].localizedCapitalized
        cell.MoviePoster.sd_setImage(with: URL(string: "http://image.tmdb.org/t/p/w185/\(MoviePosterImages[indexPath.row])"), placeholderImage: UIImage(named: "placeholder.png"))
        selectedCell = cell
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("index path :  \(indexPath.item)")
        selectedIndex = indexPath.item
        
        self.performSegue(withIdentifier: "toDetails", sender: self)
        print(type(of: indexPath.row))
    }
    
    //MARK : Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("seguq \(segue)")
        router.routeTotoDetails(segue: segue, indexPath: selectedIndex)
        
//        if let scene = segue.identifier {
//            let selector = NSSelectorFromString("routeTo\(scene)")
//            print(selector)
////            router?.responds(to: selector)
////            router?.perform(selector, with: segue)
//            if let router = router, router.responds(to: selector) {
//                router.perform(selector, with: segue)
//            }
//        }
    }
}
