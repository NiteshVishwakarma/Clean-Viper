//
//  CreateOrderPresenter.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 19/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

protocol CreateOrderPresenterInput {
    func presentSomething(response: CreateOrderResponse)
    func presentExpirationDate(response : CreateOrder_FormatExpirationDate_Response)
    func presentUsernameV_V(response : CreateOrder_Login_Response)
    func presentData(response : API_CALLS)
}
protocol CreateOrderPresenterOutput : class {
    func displaySomething(viewModel : CreateOrderViewModel)
    func displayExpirationDate(viewModel : CreateOrder_FormatExpirationDate_ViewModel)
}

class CreateOrderPresenter : CreateOrderPresenterInput
{
    func presentData(response: API_CALLS) {
        //let viewModel = API_CALLS.ViewModel(data: response)
        
        
    }
    
    func presentUsernameV_V(response: CreateOrder_Login_Response) {
        let response = CreateOrder_Login_ViewModel(username_Status: response.username)
        output.displayUserV_V(viewModel: response)
    }
    
//    let dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
//        return dateFormatter
//    }()
//
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = DateFormatter.Style.none
        return dateFormatter
    }()
    func presentExpirationDate(response: CreateOrder_FormatExpirationDate_Response) {
        let date = dateFormatter.string(from: response.date as Date)
        let viewModel = CreateOrder_FormatExpirationDate_ViewModel(date: date)
        output.displayExpirationDate(viewModel: viewModel)
    }
    
    var output : CreateOrderViewControllerInput!
    
    func presentSomething(response : CreateOrderResponse)
    {
        let viewModel = CreateOrderViewModel(csrf: response.csrf)
        output.displaySomething(viewModel: viewModel)
    }
}
