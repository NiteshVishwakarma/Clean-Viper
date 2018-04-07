//
//  LandingScreenModel.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

struct LandingScreen
{
    // MARK : MoviesList struct
    struct MovieList
    {
        struct Request {}
        struct Resposne {
            var list : [MovieMapper]
        }
        struct ViewModel {
            var list : [MovieMapper]
        }
    }
}




