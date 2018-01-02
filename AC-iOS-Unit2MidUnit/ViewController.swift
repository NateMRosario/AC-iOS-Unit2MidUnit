//
//  ViewController.swift
//  AC-iOS-Unit2MidUnit
//
//  Created by C4Q  on 10/18/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var monologue = PoloniusMonologueModel()
    var script = RomeoAndJulietModel()
    
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var lineDisplay: UITextView!
    @IBOutlet weak var outputView: UITextView!
    
    override func viewDidLoad() {
        searchInput.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextLineButtonPressed(_ sender: UIButton) {
        monologue.lines()
        lineDisplay.text = monologue.currentLine
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let nameInput = searchInput.text else {
            return false
        }
        searchInput.text = ""
        switch script.searchName(nameInput) {
        case .romeo:
            invalidLabel.isHidden = true
        outputView.text = script.romeoString
        case .benvolio:
            invalidLabel.isHidden = true
            outputView.text = script.benvolioString
        case .mercutio:
            invalidLabel.isHidden = true
        outputView.text = script.mercutioString
        case .invalid:
            invalidLabel.isHidden = false
        }
        return true
    }
}

