//
//  ViewController.swift
//  SetColor
//
//  Created by Сергей Ткаченко on 22.09.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var doneButton: UIButton!
    
    var delegate: ColorDelegate?
    var colorFromMainVC: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        //Setup red slider
        redSlider.thumbTintColor = .red
        redSlider.minimumTrackTintColor = .red
        
        //Setup green slider
        greenSlider.thumbTintColor = .green
        greenSlider.minimumTrackTintColor = .green
        
        //Setup blue slider
        blueSlider.thumbTintColor = .blue
        blueSlider.minimumTrackTintColor = .blue
        
        //Setup views
        mainView.layer.cornerRadius = mainView.bounds.width/10
        
        mainView.backgroundColor = colorFromMainVC
        
//        setColor()
        setValueForSlider()
        setValueForLabel()
        setValueForTextField()
        
        addDoneButtonFor(redTextField)
        addDoneButtonFor(greenTextField)
        addDoneButtonFor(blueTextField)
        
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case 1:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        case 2:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        default: break
        }
        
        setColor()
    }
    
    // Цвет вью
    func setColor() {
        let newColor = UIColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value),
                                           alpha: 1)
        mainView.backgroundColor = newColor
        delegate?.setColor(newColor)
    }
    
    
//    @IBAction func setValueOfTextField(_ sender: UITextField) {
//        guard let text = sender.text else { return }
//
//        if let currentValue = Float(text) {
//
//            switch sender.tag {
//            case 0: redSlider.value = currentValue
//            case 1: greenSlider.value = currentValue
//            case 2: blueSlider.value = currentValue
//            default: break
//            }
//
//            setColor()
//            setValueForLabel()
//        } else {
//            ShowAllert(title: "Введено неверное значение", message: "Пожалуйста, введите значение от 0 до 1", textField: redTextField)
//        }
//    }
    
    private func setValueForSlider() {
        let ciColor = CIColor(color: colorFromMainVC)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    // Значение лейбла
    private func setValueForLabel() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    // Значение текстового поля
    private func setValueForTextField() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
}

extension ViewController: UITextFieldDelegate {
    
    // Скрыть клавиатуру нажатем на кнопку "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрыть клавиатуру по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // скрывает клавиатуру вызванную для любого объекта
    }
    
//  СРАБОТАЛО! Делегейт из сториборд во вьюКонтроллер:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        guard let text = textField.text else { return }

        if let currentValue = Float(text) {

            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }

            setColor()
            setValueForLabel()
        } else {
            ShowAllert(title: "Введено неверное значение", message: "Пожалуйста, введите значение от 0 до 1", textField: redTextField)
        }
    }
}

extension ViewController {
    
    // Отображение кнопки "Done" на цифровой клавиатуре
    private func addDoneButtonFor(_ textField: UITextField) {
        
        let doneToolBar: UIToolbar = UIToolbar()
        textField.inputAccessoryView = doneToolBar
        doneToolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: nil,
                                         action: #selector(doneClicked))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        doneToolBar.setItems([flexBarButton, doneButton], animated: false)
        
    }
    
    @objc private func doneClicked() {
        view.endEditing(true)
    }

    private func ShowAllert(title: String, message: String, textField: UITextField) {
        let allert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAсtion = UIAlertAction(title: "Ok", style: .default) { _ in
            textField.text = "1"
        }
        
        allert.addAction(okAсtion)
        present(allert, animated: true)
    }
}


