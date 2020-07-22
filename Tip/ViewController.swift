//
//  ViewController.swift
//  Tip
//
//  Created by Goral Pahuja on 7/21/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Attaches/Declares the UI Fields
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
//    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numPeopleTextField: UITextField!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        /**
         Dismisses the Keyboard once the View is tapped
         */
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        /**
         Calculates the tip and total using the "Bill" value from the Text Field object and the "Tip Percentage" value from the Slider object.
         */
        
        // Get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentage = Double(Int(tipPercentageSlider.value)) / 100.0
        //        let tipPercentages = [0.15, 0.18, 0.20]
        
        tipPercentageLabel.text = String(format: "%i%%", Int(tipPercentageSlider.value))
        
        // Calculate the tip and total
        let tip = bill * Double(tipPercentage)
        //        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func splitBill(_ sender: Any) {
        /**
         Splits the total bill by the number of people attending the restaurant, in order to calculate the amount each person needs to pay
         */
        
        let preSplitTotal = Double(totalLabel.text!.replacingOccurrences(of: "$", with: "")) ?? 0
        let numPeople = Int(numPeopleTextField.text!) ?? 1
        let individualBill = preSplitTotal / Double(numPeople)
        
        totalPerPersonLabel.text = String(format: "$%.2f", individualBill)
    }
    
}
