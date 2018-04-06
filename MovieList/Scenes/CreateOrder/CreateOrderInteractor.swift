//
//  CreateOrderInteractor.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 19/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

protocol CreateOrderInteractorInput {
    //Output of View Controller as input to Interactor
    func doSomething(request : CreateOrderRequest)
    func formatExpirationDate(request : CreateOrder_FormatExpirationDate_Request)
    func performUsernameV_V(request : CreateOrder_Login_Request)
    // MARK : INPUTS FROM WORKERS
    func getData(response : API_CALLS.Response)
}
protocol CreateOrderInteractorOutput {
    // Result is output to presenter
    func presentSomething(response : CreateOrderResponse )
    func presentExpirationDate(response : CreateOrder_FormatExpirationDate_Response)
}

class CreateOrderInteractor : CreateOrderInteractorInput
{
    func getData(response: API_CALLS.Response) {
        let response  = API_CALLS()
        output.presentData(response : response)
    }
    
    func performUsernameV_V(request : CreateOrder_Login_Request)
    {
        worker = CreateOrderWorker()
        let status = worker.V_V(username: request.username)
        let response = CreateOrder_Login_Response(username: status)
        print("response \(response)")
        output.presentUsernameV_V(response : response)
        
    }
    
    func formatExpirationDate(request: CreateOrder_FormatExpirationDate_Request) {
        let response = CreateOrder_FormatExpirationDate_Response(date: request.date)
        output.presentExpirationDate(response: response)
    }
    
    // MARK : Variables
    var output : CreateOrderPresenterInput!
    var worker : CreateOrderWorker! // get work done by worker
    
    //MARK : Bussiness Logic
    
    func doSomething(request : CreateOrderRequest)
    {
        worker = CreateOrderWorker()
        let csrf = worker.doSomeWork()
            .subscribe(onNext:{
                response in
                let viewModel = CreateOrderResponse(csrf: response)
                self.output.presentSomething(response: viewModel)
            })
        // pass the result to presenter immediately becuase this is one task... there would be many!
        
        
    }
    
    
}
