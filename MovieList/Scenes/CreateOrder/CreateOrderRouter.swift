//
//  CreateOrderRouter.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 19/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit

protocol CreateOrderRouterInput {
    func navigateToSomewhere()
}

class CreateOrderRouter : CreateOrderRouterInput
{
    weak var viewController : CreateOrderViewController!
    var dataSource : CreateOrderInteractorInput!
    //MARK : Navigation Code
    func navigateToSomewhere() {
        //navigation can also be done via storyboard
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: t
    }
    func passDataToNextScene(segue: UIStoryboardSegue)
    {
        if segue.identifier == "ShowSomeWhereScene"
        {
            passDataToSomeWhereScene(segue: segue)
        }
    }
    func passDataToSomeWhereScene(segue : UIStoryboardSegue)
    {
        //let someWhereViewComtroller = segue.destination as! SomeWhereViewController
        //someWhereViewController.output.name = viewController.output.name
        // i.e ToNextScene                    = My Current ViewController
    }
}
