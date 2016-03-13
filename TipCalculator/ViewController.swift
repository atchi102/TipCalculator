//
//  ViewController.swift
//  TipCalculator
//
//  Created by Abigail Atchison on 3/13/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var billTB: UITextField!
    @IBOutlet weak var tipTB: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        ratingSlider.value = 5
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ratingBarChanged(sender: UISlider) {
        sender.value = sender.value.roundUp
    }
    @IBAction func calculateTip(sender: UIButton) {
        calc(billTB.text!.floatValue, ratingAmount:  ratingSlider.value)
        
    }
    
    func calc(billAmount : Float = 0.0, ratingAmount : Float)
    {
        var tip : Float = 0.0
        if(ratingAmount <= 3)
        {
            tip = (billAmount*10)/100
        }
        else if(ratingAmount <= 5)
        {
            tip = (billAmount*13)/100
        }
        else if(ratingAmount <= 7)
        {
            tip = (billAmount*15)/100
        }
        else if(ratingAmount <= 9)
        {
            tip = (billAmount*20)/100
        }
        else
        {
            tip = (billAmount*25)/100
        }
        let stringTip : String = String(format: "%.2f", tip)
        tipTB.text = "$\(stringTip)"
    }
    
    

}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension Float {
    var roundUp : Float {
        if(self - Float(Int(self)) >= 0.5)
        {
            return Float(Int(self))+1
        }
        return Float(Int(self))
    }
    
    var currencyFormat : Float{
        var tempval : Float = self*100
        tempval -= (tempval - Float(Int(tempval)))
        print("currency: \(tempval)")
        tempval = tempval/100
        return tempval/100
    }
}

