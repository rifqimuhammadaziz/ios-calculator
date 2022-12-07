//
//  ViewController.swift
//  Calculator
//
//  Created by Rifqi Muhammad Aziz on 07/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var performingMath = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            textLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(textLabel.text!)!
            performingMath = false
        } else {
            textLabel.text = textLabel.text! + String(sender.tag - 1)
            numberOnScreen = Double(textLabel.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if textLabel.text != "" && sender.tag != 15 && sender.tag != 16 {
            previousNumber = Double(textLabel.text!)!
            if sender.tag == 11 { // divide button
                textLabel.text = "/"
            } else if sender.tag == 12 { // multiple button
                textLabel.text = "*"
            } else if sender.tag == 13 { // minus button
                textLabel.text = "-"
            } else if sender.tag == 14 { // plus button
                textLabel.text = "+"
            }
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 15 {
            if operation == 11 { // divide operation
                textLabel.text = String(previousNumber / numberOnScreen)
            } else if operation == 12 { // multiple operation
                textLabel.text = String(previousNumber * numberOnScreen)
            } else if operation == 13 { // minus operation
                textLabel.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 { // plus operation
                textLabel.text = String(previousNumber + numberOnScreen)
            }
        } else if sender.tag == 16 {
            textLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}

