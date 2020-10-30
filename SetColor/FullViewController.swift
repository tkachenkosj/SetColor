//
//  FullViewController.swift
//  SetColor
//
//  Created by Сергей Ткаченко on 29.10.2020.
//  Copyright © 2020 Sergey Tkachenko. All rights reserved.
//

import UIKit

class FullViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ViewController
        colorVC.colorFromMainVC = view.backgroundColor
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let colorVC = segue.source as! ViewController
        colorVC.delegate = self
        colorVC.setColor()
    }

}

extension FullViewController: ColorDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

