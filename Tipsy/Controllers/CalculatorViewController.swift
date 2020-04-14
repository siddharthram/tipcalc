//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var splitValue: UILabel!
    @IBOutlet weak var billTotal: UITextField!
    
    @IBOutlet weak var splitNumberValue: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    var tip:Float = 0.0
    var total:Float = 0.0
    var amount:Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func totalUpdated(_ sender: UITextField) {
        print(sender.text ?? "Dont k")
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        billTotal.endEditing(true)
        switch(sender.currentTitle) {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.0
            break
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.1
            break
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.2
            break
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.0
            break
        }
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        print(billTotal.text!)
        let total:Float? = Float(billTotal.text!)
        let split:Float? = Float(splitNumberValue.text!)
        amount = (total! + (tip * total!))/(split ?? 0.0)
        print(amount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    
    }
    @IBAction func stepper(_ sender: UIStepper) {

        splitNumberValue.text = String(Int(sender.value))
        print(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perPerson = String(amount)
            destinationVC.split =  splitNumberValue.text ?? "0"
            destinationVC.tip = String(tip*100)
        }
        
    }
    
}

