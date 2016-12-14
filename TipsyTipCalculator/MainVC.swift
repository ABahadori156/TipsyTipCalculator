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
    
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitIndividual: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    
    
    let tipCalc = TipsyCalc(billAmount: 50.00, tipPercent: 0.15, friends: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentValue()
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    //We set the event to 'Editing changed' - everytime the text in this text field changes, you let me know so I can execute this function
    @IBAction func billCharge(_ sender: UITextField) {
        calculateTip()
        calculateSplit()
    }
   
    @IBAction func tipPercentChanged(_ sender: AnyObject) {
        tipPercentValue()
        calculateTip()
    }
    
    @IBAction func splitIndividualChanged(_ sender: AnyObject) {
        splitIndividualValue()
        calculateSplit()
    }
    
    
    func calculateTip() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billTextField.text)! as NSString).doubleValue
        tipCalc.calculateTip()
        updateBillUI()
    }
    
    func calculateSplit() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billTextField.text)! as NSString).doubleValue
        tipCalc.friends = Int(splitSlider.value)
        tipCalc.calculateSplitAmount()
        updateBillUI()
        
    }
    
    func updateBillUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tipCalc.tipAmount)
        totalAmount.text = String(format: "$%0.2f", tipCalc.totalAmount)
        splitAmount.text = String(format: "$%0.2f", tipCalc.splitAmount)
    }

    func tipPercentValue() {
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
    
    func splitIndividualValue() {
        splitIndividual.text = "Split: \(Int(splitSlider.value))"
    }
    
    func dismissKeyboard() {
        // self.view.endEditing(true)
        billTextField.resignFirstResponder()
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height / 3
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height / 3
            }
        }
    }

    

}

