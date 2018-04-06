//
//  CreateOrderConfigurator.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 19/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

extension CreateOrderViewController : CreateOrderPresenterOutput
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}
extension CreateOrderInteractor : CreateOrderViewControllerOutput
{
    var shippingMethods: [String] {
        
    }
    
    
}
extension CreateOrderPresenter : CreateOrderInteractorOutput
{
    
}

class CreateOrderConfigurator
{
    static let sharedInstance = CreateOrderConfigurator()
    func configure(viewController : CreateOrderViewController)
    {
        let router = CreateOrderRouter()
        router.viewController = viewController
        
        let presenter = CreateOrderPresenter()
        presenter.output = viewController as CreateOrderPresenterOutput // Used as! for helper fixes
        
        let iteractor = CreateOrderInteractor()
        iteractor.output = presenter
        // Used as! for helper fixes
        
        viewController.output = iteractor as CreateOrderViewControllerOutput // Used as! for helper fixes
        viewController.router = router
    }
}
