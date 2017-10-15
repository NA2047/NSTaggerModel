//
//  ViewController.swift
//  DemoCPSC599
//
//  Created by Andrew on 2017-10-10.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var domAnswer: UILabel!
    @IBOutlet weak var displayText: UITextView!
    @IBOutlet weak var textToRun: UITextView!

    @IBOutlet weak var whatToPull: UITextField!
    private var model = Model()

    var displayValue:String{
        get{
            if let display = displayText.text{
                return display
            }
            else{
                return ""
            }
        }
        set{
            displayText.text = newValue
            domAnswer.text = model.domLang
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let runText = textToRun.text{
             let  arr = model.process2(toBeProcess: runText, lookfor: .NameType)
            var str = ""
                for intem in arr{
                    str += intem + "-"
                }
            displayValue = str
            
    
       
    }
 
 
    }
    
    @IBAction func lemmaPressed(_ sender: UIButton) {
        if let runText = textToRun.text{
            let  arr = model.process(toBeProcess: runText, lookfor: .LexicalClass)
            var str = ""
            for intem in arr{
                str += intem + "-"
            }
            displayValue = str
            
            
            
        }
        
    
}
}
