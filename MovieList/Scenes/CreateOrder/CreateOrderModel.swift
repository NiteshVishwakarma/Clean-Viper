//
//  CreateOrderModel.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 19/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

struct CreateOrderRequest
{
    
}
struct CreateOrderResponse
{
    var csrf : String
}
struct CreateOrderViewModel
{
    var csrf : String
}
struct CreateOrder_FormatExpirationDate_Request
{
    var date : NSDate
}
struct CreateOrder_FormatExpirationDate_Response
{
    var date : NSDate
}
struct CreateOrder_FormatExpirationDate_ViewModel
{
    var date : String
}
struct CreateOrder_Login_Request
{
    var username : String
}
struct CreateOrder_Login_Response
{
    var username : Bool
}
struct CreateOrder_Login_ViewModel
{
    var username_Status : Bool
}
