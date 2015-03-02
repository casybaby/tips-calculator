//
//  TipsViewController.swift
//  tips
//
//  Created by Jintai He on 2/23/15.
//  Copyright (c) 2015 Jintai He. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {

    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTotalAmount()
    }

    func updateTotalAmount() {
        var tipPercentages = [getDefaultTipPercentage(), 0.18, 0.20, 0.22]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentages[tipController.selectedSegmentIndex]
        var total = billAmount + tip
        
        tipLabel.text = NSString(format: "$%.2f", tip)
        totalLabel.text = NSString(format: "$%.2f", total)
    }
    
    func getDefaultTipPercentage() -> Double {
        var defaults = NSUserDefaults.standardUserDefaults()
        return defaults.doubleForKey("defaultTipsPercentage")
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTotalAmount()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

