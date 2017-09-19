//
//  ViewController.swift
//  tipPro
//
//  Created by Yves Songolo on 7/11/17.
//  Copyright © 2017 Yves Songolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillAmountTextField: UITextField!
    @IBOutlet weak var TipSelector: UISegmentedControl!
    @IBOutlet weak var TipAmountTextfield: UITextField!
    @IBOutlet weak var Totaltextfield: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func CalculateButton(_ sender: Any) {
        
        if let billAmount = Double(BillAmountTextField.text!) {
            var tipPercentage = 0.0
            
            switch TipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100*tipAmount)/100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!BillAmountTextField.isEditing) {
                BillAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            }
            TipAmountTextfield.text = String(format: "%.2f", roundedTipAmount)
            Totaltextfield.text = String(format: "%.2f", totalAmount)
        } else {
            //show error
            BillAmountTextField.text = ""
            TipAmountTextfield.text = ""
            Totaltextfield.text = ""
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

