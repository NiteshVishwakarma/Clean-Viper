//
//  AuthenticationUseCase.swift
//  TheMoviesApp
//
//  Created by Nitesh Vishwakarma on 22/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol MovieListUseCase {
    func getMovieList() -> Observable<[MovieMapper]>
}
