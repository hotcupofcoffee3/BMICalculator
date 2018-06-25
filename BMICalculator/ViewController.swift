//
//  ViewController.swift
//  BMICalculator
//
//  Created by Adam Moore on 3/17/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var metricHeight = 0.0
    var metricWeight = 0.0

    @IBOutlet weak var heightInCmInput: UITextField!
    @IBOutlet weak var weightInKgInput: UITextField!
    @IBOutlet weak var resultingMetricBMILabel: UILabel!
    @IBOutlet weak var metricHeightWarningLabel: UILabel!
    @IBOutlet weak var metricWeightWarningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        metricHeightWarningLabel.text = ""
        metricWeightWarningLabel.text = ""
        resultingMetricBMILabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateMetricHeight(){
        if let heightInCm = Double(heightInCmInput.text!) {
            metricHeightWarningLabel.text = ""
            metricHeight = heightInCm / 100
        } else {
            metricHeightWarningLabel.text = "Please enter a height"
        }
    }
    
    func calculateMetricWeight(){
        if let weightInKg = Double(weightInKgInput.text!) {
            metricWeightWarningLabel.text = ""
            metricWeight = weightInKg
        } else {
            metricWeightWarningLabel.text = "Please enter a weight"
        }
    }
    
    @IBAction func calculateBMIButtonPressedOnMetricSide(_ sender: UIButton) {
        calculateMetricHeight()
        calculateMetricWeight()
        calculateBMI(heightInMeters: metricHeight, weightInKg: metricWeight, bMILabel: resultingMetricBMILabel)
    }
    
}















