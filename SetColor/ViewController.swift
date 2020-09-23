//
//  ViewController.swift
//  SetColor
//
//  Created by Сергей Ткаченко on 22.09.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var mainView: UIView!
//    @IBOutlet var greenView: UIView!
//    @IBOutlet var blueView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    private var redValue: CGFloat = 0.2
    private var greenValue: CGFloat = 0.5
    private var blueValue: CGFloat = 0.8
    
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
        
        //Setup views
        mainView.layer.cornerRadius = mainView.bounds.width/10
        
        //Add toolbar and Done button
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        doneToolBar.setItems([doneButton], animated: false)
        redTextField.inputAccessoryView = doneToolBar
        greenTextField.inputAccessoryView = doneToolBar
        blueTextField.inputAccessoryView = doneToolBar
        
        //Hide keyboard by tap
        self.redTextField.delegate = self
        self.greenTextField.delegate = self
        self.blueTextField.delegate = self
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func setRed() {
        redLabel.text = "Red: \((redSlider.value * 100).rounded() / 100)"
        redTextField.text = "\((redSlider.value * 100).rounded() / 100)"
        redValue = CGFloat(redSlider.value)
        
        mainView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
    @IBAction func setGreen() {
        greenLabel.text = "Green: \((greenSlider.value * 100).rounded() / 100)"
        greenTextField.text = "\((greenSlider.value * 100).rounded() / 100)"
        greenValue = CGFloat(greenSlider.value)
        
        mainView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
    @IBAction func setBlue() {
        blueLabel.text = "Blue: \((blueSlider.value * 100).rounded() / 100)"
        blueTextField.text = "\((blueSlider.value * 100).rounded() / 100)"
        blueValue = CGFloat(blueSlider.value)
        
        mainView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
    @IBAction func inputRed() {
        guard let inputValue = redTextField.text, !inputValue.isEmpty else { return }
        
        if Double(inputValue)! > 1 {
            ShowAllert(title: "Введено неверное значение", message: "Пожалуйста, введите значение от 0 до 1", textField: redTextField)
        }
        
        redSlider.value = Float(inputValue)!
        redLabel.text = "Red: \(inputValue)"
        redValue = CGFloat(Float(inputValue)!)
        
        mainView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
    @IBAction func inputGreen() {
        guard let inputValue = greenTextField.text, !inputValue.isEmpty else { return }
        
        if Double(inputValue)! > 1 {
            ShowAllert(title: "Введено неверное значение", message: "Пожалуйста, введите значение от 0 до 1", textField: greenTextField)
        }
        
        greenSlider.value = Float(inputValue)!
        greenLabel.text = "Green: \(inputValue)"
        greenValue = CGFloat(Float(inputValue)!)
        
        mainView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
    @IBAction func inputBlue() {
        guard let inputValue = blueTextField.text, !inputValue.isEmpty else { return }
        
        if Double(inputValue)! > 1 {
            ShowAllert(title: "Введено неверное значение", message: "Пожалуйста, введите значение от 0 до 1", textField: blueTextField)
        }
        
        blueSlider.value = Float(inputValue)!
        blueLabel.text = "Green: \(inputValue)"
        blueValue = CGFloat(Float(inputValue)!)
        
        mainView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
}

extension ViewController {
    private func ShowAllert(title: String, message: String, textField: UITextField) {
        let allert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAktion = UIAlertAction(title: "Ok", style: .default) { _ in
            textField.text = "1"
        }
        
        allert.addAction(okAktion)
        present(allert, animated: true)
    }
}


