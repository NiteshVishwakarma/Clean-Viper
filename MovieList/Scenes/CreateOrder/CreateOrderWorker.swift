//
//  CreateOrderWorker.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 19/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
protocol CreateOrderWorkerInput {
    func getAppStoreDetails(request : API_CALLS.Request)
    
}

class CreateOrderWorker : CreateOrderWorkerInput
{
    func getAppStoreDetails(request: API_CALLS.Request) {
        
    }
    
    
//    func getAppStoreDetails(request: API_CALLS.Request) {
//        let api : AppStoreService = ItunesWebService()
//
//        let response = api.retrieveTopFreeApps(count: 20, completion: {result in
//            switch result {
//            case .success(let apps):
//
//            }
//        })
//
//       // output.getData(response: response)
//    }
    
    
    
    var output : CreateOrderInteractor!
    var disposebag = DisposeBag()
    
    func doSomeWork()  -> Observable<String>
    {
        print("I reached")
        let use = GetCSRFUseCaseImpl().getCSRF()
        return use
    }

    func V_V(username: String) -> Bool
    {
        var status :  Bool!
        if (username.characters.count > 3)
        {
             status = true
        }
        else
        {
             status = false
        }
        return status
    }
}

