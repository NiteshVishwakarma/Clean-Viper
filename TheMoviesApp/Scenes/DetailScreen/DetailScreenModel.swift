//
//  DetailScreenModel.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 26/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

struct DetailScreen
{
    // MARK : MoviesList struct
    struct Movie
    {
        struct Request {}
        struct Resposne {
            var movieData : MovieMapper
        }
        struct ViewModel {
            var movieData : MovieMapper
        }
    }
}

