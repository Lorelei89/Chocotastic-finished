//
//  CartViewController.swift
//  Chocotastic
//
//  Created by Ellen Shapiro on 6/6/16.
//  Copyright © 2016 RayWenderlich.com. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet private var checkoutButton: UIButton!
    @IBOutlet private var totalItemsLabel: UILabel!
    @IBOutlet private var totalCostLabel: UILabel!
    
    
    //MARK: - View Lifecycle 
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Cart"
        configureFromCart()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    private func configureFromCart() {
        guard checkoutButton != nil else {
            //UI has not been instantiated yet. Bail!
            return
        }
        
        let cart = ShoppingCart.sharedCart
        totalItemsLabel.text = cart.itemCountString()
        
        let cost = cart.totalCost()
        totalCostLabel.text = CurrencyFormatter.dollarsFormatter.stringFromNumber(cost)
        
        //Disable checkout if there's nothing to check out with
        checkoutButton.enabled = (cost > 0)
    }
    
    @IBAction func reset() {
        ShoppingCart.sharedCart.chocolates.value = []
        navigationController?.popViewControllerAnimated(true)
    }
}
