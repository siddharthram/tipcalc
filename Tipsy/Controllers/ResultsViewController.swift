//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Siddharth Ram on 4/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var perPerson:String?
    var split:String?
    var tip:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = perPerson ?? "0"
    //let s1:String = "Split between " + split
        //let s2:String = " people, with " + tip + "
        let s1:String  = "Split between " + split!
        let s2:String = " people, with " + tip! + "0" + "%tip."
        settingsLabel.text = s1+s2

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
