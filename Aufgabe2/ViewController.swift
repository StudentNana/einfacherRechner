//
//  ViewController.swift
//  Aufgabe2
//
//  Created by Sagitova Gulnaz on 21.10.16.
//  Copyright © 2016 Sagitova Gulnaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation {
        case Minus;
        case Plus;
        case Multi;
        case Divide;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lastOper.numberOfLines = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var currentInput:NSString = ""
    var firstNum:String = ""
    var secondNum:String = ""
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var pndisplay: UILabel!
    @IBOutlet weak var lastOper: UILabel!
    
    var lastOperationen:NSMutableString = ""
    
    @IBAction func enterBTN(_ sender: AnyObject) {
        firstNum = display.text!
        print("firstNum " + firstNum)
        display.text = "0"
        currentInput = ""
    }
    
    @IBAction func drueckeBTN(_ sender: AnyObject) {
        let s = sender.currentTitle
        currentInput = currentInput.appending(s!!) as NSString
        display.text = currentInput as String
    }
    
    // minus
    @IBAction func subtrahieren(_ sender: AnyObject) {
        calculieren(operation: Operation.Minus)
    }
    
    // teilen
    @IBAction func teilen(_ sender: AnyObject) {
        calculieren(operation: Operation.Divide)
    }
    
    // summa
    @IBAction func summieren(_ sender: AnyObject) {
        calculieren(operation: Operation.Plus)
    }
    
    // mal
    @IBAction func multiplizieren(_ sender: AnyObject) {
        calculieren(operation: Operation.Multi)
    }
    
    func calculieren(operation: Operation) {
        secondNum = display.text!
        print("secondNum " + secondNum)
        var sub1:Int
        var sub:String
        let a:Int = Int(firstNum)!
        let b:Int = Int(secondNum)!
        switch operation {
            case Operation.Minus:
                sub1 = a - b;
                updateLastOperation(operation: "\(a) - \(b) = \(sub1) " + "\n")
            case Operation.Plus:
                sub1 = a + b;
                updateLastOperation(operation: "\(a) + \(b) = \(sub1) " + "\n")
            case Operation.Multi:
                sub1 = a * b;
                updateLastOperation(operation: "\(a) * \(b) = \(sub1) " + "\n")
            case Operation.Divide:
                sub1 = (a / b);
                updateLastOperation(operation: "\(a) / \(b) = \(sub1) " + "\n")
        }
        if (sub1 >= 0){
            pndisplay.text = "P"
        }else{
            pndisplay.text = "N"
        }
        sub = String(sub1)
        display.text = sub
    }
    
    func updateLastOperation(operation: String) {
        lastOperationen.insert(operation, at: 0)
        lastOper.text = lastOperationen as String
    }
    
}

