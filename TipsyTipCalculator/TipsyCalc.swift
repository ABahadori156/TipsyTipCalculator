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
    private var _friends: Int = 0
    private var _splitAmount: Double = 0
    
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
    
    var friends: Int {
        get {
            return _friends
        }
        set {
            _friends = newValue
        }
    }
    
    //Getters only
    var tipAmount: Double {
        return _tipAmount
    }
    
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var splitAmount: Double {
        return _splitAmount
    }
    
    init(billAmount: Double, tipPercent: Double, friends: Int) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._friends = friends
    }
    
    func calculateTip() {
        _tipAmount = _billAmount * _tipPercent
        _totalAmount = _tipAmount + _billAmount
    }
    
    func calculateSplitAmount() {
        _tipAmount = _billAmount * _tipPercent
        _totalAmount = _tipAmount + _billAmount
        _splitAmount = _totalAmount / Double(_friends)
        
    }
    
    
}




