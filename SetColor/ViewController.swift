//
//  ViewController.swift
//  SetColor
//
//  Created by Сергей Ткаченко on 22.09.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var blueView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup red slider
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0.2
        redSlider.thumbTintColor = .red
        redSlider.minimumTrackTintColor = .red
        
        //Setup green slider
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0.5
        greenSlider.thumbTintColor = .green
        greenSlider.minimumTrackTintColor = .green
        
        //Setup blue slider
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0.8
        blueSlider.thumbTintColor = .blue
        blueSlider.minimumTrackTintColor = .blue
        
        //Setup red label
        redLabel.text = "Red:    \(String(redSlider.value))"
        
        //Setup green label
        greenLabel.text = "Green: \(String(greenSlider.value))"
        
        //Setup blue label
        blueLabel.text = "Blue:   \(String(blueSlider.value))"
        
        //Setup red text field
        redTextField.text = String(redSlider.value)
        
        //Setup green label
        greenTextField.text = String(greenSlider.value)
        
        //Setup blue label
        blueTextField.text = String(blueSlider.value)
    }


}

