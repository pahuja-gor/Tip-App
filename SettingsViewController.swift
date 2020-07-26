//
//  SettingsViewController.swift
//  Tip
//
//  Created by Goral Pahuja on 7/24/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSlider: UISlider!
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var defaultSplitTextField: UITextField!
    @IBOutlet weak var defaultSplitLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaultTip = defaults.integer(forKey: "defaultTip")
        defaultTipSlider.value = Float(defaultTip)
        defaultTipLabel.text = String(defaultTip) + "%"
        
        let defaultSplit = defaults.integer(forKey: "defaultSplit")
        defaultSplitTextField.text = String(defaultSplit)
        defaultSplitLabel.text = "Num. of People: " + String(defaultSplit)
    }
    
    @IBAction func onTap(_ sender: Any) {
        /**
         Dismisses the Keyboard once the View is tapped
         */
        
        view.endEditing(true)
    }
    
    @IBAction func updateDefaultTip(_ sender: Any) {
        let defaultTip = Int((sender as! UISlider).value)
        defaultTipLabel.text = String(defaultTip) + "%"
        defaults.set(defaultTip, forKey: "defaultTip")
    }
    
    @IBAction func updateDefaultSplit(_ sender: Any) {
        let defaultSplit = Int((sender as! UITextField).text!) ?? 1
//        defaultSplitTextField.text = String(defaultSplit)
        defaultSplitLabel.text = "Num. of People: " + String(defaultSplit)
        defaults.set(defaultSplit, forKey: "defaultSplit")
        
//        print(defaultSplitLabel.text)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
