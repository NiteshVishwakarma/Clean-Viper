//
//  File.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 26/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

protocol DetailScreenRouterInput {
    
}
protocol DetailScreenRouterDataPassing {
    var dataStore : DetailScreenDataSource? { get }
}

class DetailScreenRouter : DetailScreenRouterDataPassing
{
    // MARK : Variables
    var dataStore : DetailScreenDataSource?
    var viewController : DetailScreenViewController!
    
    
    
}
