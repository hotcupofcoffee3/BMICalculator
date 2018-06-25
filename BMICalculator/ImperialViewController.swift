//
//  ImperialViewController.swift
//  BMICalculator
//
//  Created by Adam Moore on 3/17/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

func calculateBMI(heightInMeters: Double, weightInKg: Double, bMILabel: UILabel) {
    let calculatedBMI = weightInKg / pow(heightInMeters, 2)
    let shortenedBMI = String(format: "%0.2f", calculatedBMI)
    if heightInMeters == 0 || weightInKg == 0 {
        bMILabel.text = "Your BMI is: 0"
    } else {
        bMILabel.text = "Your BMI is: \(shortenedBMI)"
    }
}

class ImperialViewController: UIViewController {

    var calculatedHeightInMeters = 0.0
    var calculatedWeightInKg = 0.0
    
    @IBOutlet weak var heightInFeetInput: UITextField!
    @IBOutlet weak var heightInInchesInput: UITextField!
    @IBOutlet weak var weightInPoundsInput: UITextField!
    @IBOutlet weak var resultingImperialBMILabel: UILabel!
    @IBOutlet weak var imperialHeightWarning: UILabel!
    @IBOutlet weak var imperialWeightWarning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resultingImperialBMILabel.text = ""
        imperialHeightWarning.text = ""
        imperialWeightWarning.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateMetricFromImperialHeight() {
        if let heightInFeet = Double(heightInFeetInput.text!), let heightInInitialInchesInputted = Double(heightInInchesInput.text!) {
            imperialHeightWarning.text = ""
            let heightInInches = (heightInFeet * 12) + heightInInitialInchesInputted
            calculatedHeightInMeters = (heightInInches * 2.54) / 100
        } else {
            imperialHeightWarning.text = "Please enter a height"
        }
    }
    
    func calculateMetricFromImperialWeight() {
        if let weightInPounds = Double(weightInPoundsInput.text!) {
            imperialWeightWarning.text = ""
            calculatedWeightInKg = weightInPounds * 0.45359237
        } else {
            imperialWeightWarning.text = "Please enter a weight"
        }
    }
    
    @IBAction func calculateBMIButtonPressedOnImperialSide(_ sender: UIButton) {
        calculateMetricFromImperialHeight()
        calculateMetricFromImperialWeight()
        calculateBMI(heightInMeters: calculatedHeightInMeters, weightInKg: calculatedWeightInKg, bMILabel: resultingImperialBMILabel)
    }
    
    @IBAction func goBackToMetric(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}






