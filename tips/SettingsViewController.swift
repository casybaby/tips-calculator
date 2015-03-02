//
//  SettingsViewController.swift
//  tips
//
//  Created by Jintai He on 2/28/15.
//  Copyright (c) 2015 Jintai He. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercentage: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        defaultPercentage.text = String(format: "%0.2f", defaults.doubleForKey("defaultTipsPercentage") * 100.00)
    }
    
    @IBAction func onEditingChanged(sender: UITextField) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble((defaultPercentage.text as NSString).doubleValue / 100, forKey: "defaultTipsPercentage")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
