//
//  LandingScreenRouter.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 26/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

// MARK : LandingScreenRouterInput Protocols
@objc protocol LandingScreenRouterInput {
    func routeTotoDetails(segue : UIStoryboardSegue? ,indexPath : Int)
}
protocol LandingScreenRouterDataPassing {
    var dataStore : LandingScreenDataSource? { get }
}
class LandingScreenRouter : NSObject, LandingScreenRouterInput, LandingScreenRouterDataPassing
{
    // MaARK : Variables
    var viewController : LandingScreenViewController!
    var dataStore: LandingScreenDataSource?
    
    // MARK : Conforming to Input Protocol
    func routeTotoDetails(segue : UIStoryboardSegue?,indexPath : Int) {
     
        print("Selected Index : \(indexPath)")
        let destinationVC = segue?.destination as! DetailScreenViewController
//        let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "DetailScreenViewController") as! DetailScreenViewController
        var destinationDS = destinationVC.router?.dataStore
        print(destinationVC)
        print("Datasource : \(dataStore!.movies![1])")
        //destinationVC.router?.dataStore = dataStore!.movies as! DetailScreenDataSource
        
        passDataToDetailScreenViewController(source: dataStore!, destination: &destinationDS!, selectedIndex: indexPath)
        
    }
    // MARK : Passing Data to DetailScreenViewController
    func passDataToDetailScreenViewController(source: LandingScreenDataSource, destination: inout DetailScreenDataSource, selectedIndex : Int) {
        destination.movies = source.movies?[selectedIndex]
        source
        //let selectedRow = viewController.articlesTableView.indexPathForSelectedRow?.section
//        let selection = viewController.collectionList.
//        destination.movies = source.movies?[selection]
        //destination.movies = source.movies?[selectedRow]
    }
    

    
}
