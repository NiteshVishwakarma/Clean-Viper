//
//  GetCSRFUseCase.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 21/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import RxSwift
protocol  GetCSRFUseCase{
    func getCSRF() -> Observable<String>
}
