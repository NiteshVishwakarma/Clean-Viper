//
//  CreateOrderViewController.swift
//  MovieList
//
//  Created by Nitesh Vishwakarma on 19/03/18.
//  Copyright © 2018 Nitesh Vishwakarma. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
protocol CreateOrderViewControllerInput {
    // display something with the help of the viewModel
    func displaySomething(viewModel : CreateOrderViewModel)
    func displayExpirationDate(viewModel : CreateOrder_FormatExpirationDate_ViewModel)
    func displayUserV_V(viewModel : CreateOrder_Login_ViewModel)
}
protocol CreateOrderViewControllerOutput {
    // do something with the request made
    func doSomething(request : CreateOrderRequest) -> Observable<String>
    func formatExpirationDate(request : CreateOrder_FormatExpirationDate_Request)
}
class CreateOrderViewController : UITableViewController,UITextFieldDelegate, CreateOrderViewControllerInput
{
    func displayUserV_V(viewModel: CreateOrder_Login_ViewModel) {
        let viewModel = viewModel.username_Status
        if(viewModel == true)
        {
            shippingMethodTextField.text = "True"
        }
        else
        {
            shippingMethodTextField.text = "False"
        }
        
    }
    
    func displayExpirationDate(viewModel: CreateOrder_FormatExpirationDate_ViewModel) {
        let date = viewModel.date
        expirationDateTextField.text = date
    }
    
    
    
    //MARK : Variables
    var output : CreateOrderInteractorInput!
    var router : CreateOrderRouter!
    
    //MARK : Outlets
    @IBOutlet var Labels: [UILabel]!
    @IBOutlet var CustomerInfoTextFields: [UITextField]!
    @IBOutlet weak var shippingMethodTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
   
    @IBOutlet weak var expirationDatePicker: UIDatePicker!
    
    // MARK : Object Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    // MARK : View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       doSomethingOnLoad() // event - basically viewdidload Code here!
        configurePicker()
    }
    
    func doSomethingOnLoad()
    {
        let request = CreateOrderRequest()
        output.doSomething(request: request)
        
    }
    func displaySomething(viewModel : CreateOrderViewModel)
    {
        let token = viewModel.csrf
        shippingMethodTextField.text = token
    }
    // MARK : Bar Button Item Configuration
    func fetchLoginUsername(username : String!)
    {
        let request = CreateOrder_Login_Request(username: username)
        output.performUsernameV_V(request: request)
    }
    
    @IBAction func tapDone(_ sender: Any) {
        self.view.endEditing(true)
        fetchLoginUsername(username: shippingMethodTextField.text)
    }
    //MARK : TextFields Handler
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        if let index = CustomerInfoTextFields.index(of: textField) {
            if index < CustomerInfoTextFields.count - 1 {
                let nextTextField = CustomerInfoTextFields[index + 1]
                nextTextField.becomeFirstResponder()
            }
        }
        return true
    }
    // MARK : TableView Cell handling texting fields
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            for textField in CustomerInfoTextFields {
                if textField.isDescendant(of: cell) {
                    textField.becomeFirstResponder()
                }
            }
        }
    }
    
    // Bussiness Logic
    
    func configurePicker()
    {
        expirationDateTextField.inputView = expirationDatePicker
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup()
    {
        let viewController = self
        let interactor = CreateOrderInteractor()
        let presenter = CreateOrderPresenter()
        let router = CreateOrderRouter()
        viewController.output = interactor
        viewController.router = router
        interactor.output = presenter
        presenter.output = viewController
        router.viewController = viewController
        router.dataSource = interactor
    }
    
    // MARK : ACTION FOR EXPIRATION
    
    @IBAction func expirationDatePickerValueChanged(_ sender: Any)
    {
       let date = expirationDatePicker.date
        print(date)
        let request = CreateOrder_FormatExpirationDate_Request(date : date as NSDate)
        print(request)
        output.formatExpirationDate(request: request)
    }
    

}
