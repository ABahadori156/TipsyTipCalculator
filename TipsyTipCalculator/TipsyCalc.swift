//
//  TipCalcBrains.swift
//  TipsyTipCalculator
//
//  Created by Pasha Bahadori on 12/11/16.
//  Copyright © 2016 Pelican. All rights reserved.
//

import Foundation

class TipsyCalc {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    
    //Setting up Getters & Setters
    // “Inside the brackets you are going to set the new value by using Xcode's built in function newValue, which updates the variable with the new data for you (magical!).”
    
    var billAmount: Double {
        get {
            return _billAmount
        }
        set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        }
        set {
            _tipPercent = newValue
        }
    }
    
    //Getters only
    var tipAmount: Double {
        return _tipAmount
    }
    
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    init(billAmount: Double, tipPercent: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    func calculateTip() {
        _tipAmount = _billAmount * _tipPercent
        _totalAmount = _tipAmount + _billAmount
    }
    
    
}




