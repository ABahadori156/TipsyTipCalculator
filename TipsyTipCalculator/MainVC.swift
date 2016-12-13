//
//  ViewController.swift
//  TipsyTipCalculator
//
//  Created by Pasha Bahadori on 12/11/16.
//  Copyright © 2016 Pelican. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmount: UILabel!

    let tipCalc = TipsyCalc(billAmount: 50.00, tipPercent: 0.15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentValue()
        
    }

    //We set the event to 'Editing changed' - everytime the text in this text field changes, you let me know so I can execute this function
    @IBAction func billCharge(_ sender: UITextField) {
        calculateTip()
    }
   
    @IBAction func tipPercentChanged(_ sender: AnyObject) {
        tipPercentValue()
        calculateTip()
    }
    
    func calculateTip() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billTextField.text)! as NSString).doubleValue
        tipCalc.calculateTip()
        updateBillUI()
    }
    
    func updateBillUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tipCalc.tipAmount)
        totalAmount.text = String(format: "$%0.2f", tipCalc.totalAmount)
    }

    func tipPercentValue() {
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }

}
