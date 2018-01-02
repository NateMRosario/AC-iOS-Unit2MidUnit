//
//  ProgrammaticViewController.swift
//  AC-iOS-Unit2MidUnit
//
//  Created by C4Q on 1/2/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class ProgrammaticViewController: UIViewController {

    var monologue = PoloniusMonologueModel()
    var script = RomeoAndJulietModel()
    
    lazy var poloniusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Polonius Monologue"
        return label
    }()
    lazy var romeoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Romeo and Juliet: Scene IV"
        return label
    }()
    
    lazy var invalidLabel: UILabel = {
        let label = UILabel()
        //TODO
        return label
    }()
    lazy var lineDisplay: UILabel = {
        let label = UILabel()
        label.text = monologue.currentLine
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var searchInput: UITextField = {
       let textField = UITextField()
        textField.delegate = self
        return textField
    }()
    
    lazy var nextLineButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Line", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextLine), for: .touchUpInside)
        return button
    }()
    @objc func nextLine() {
        monologue.lines()
        lineDisplay.text = monologue.currentLine
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        monologue.defaultLine()
        addSubViews()
        setupContraints()
    }
    func addSubViews() {
        self.view.addSubview(poloniusLabel)
        self.view.addSubview(lineDisplay)
        self.view.addSubview(nextLineButton)
        self.view.addSubview(romeoLabel)
    }
    func setupContraints() {
        poloniusLabel.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        poloniusLabel.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0).isActive = true
        poloniusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        romeoLabel.translatesAutoresizingMaskIntoConstraints = false
        romeoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        romeoLabel.topAnchor.constraint(equalTo: nextLineButton.bottomAnchor, constant: 20).isActive = true
        
        lineDisplay.translatesAutoresizingMaskIntoConstraints = false
        lineDisplay.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineDisplay.topAnchor.constraint(equalTo: poloniusLabel.bottomAnchor, constant: 20).isActive = true
        lineDisplay.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        nextLineButton.translatesAutoresizingMaskIntoConstraints = false
        nextLineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextLineButton.topAnchor.constraint(equalTo: poloniusLabel.bottomAnchor, constant: 80).isActive = true
        
        
        
    }
    
}
extension ProgrammaticViewController: UITextFieldDelegate {
    
}
