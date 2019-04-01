//
//  ViewController.swift
//  1000 Snippets
//
//  Created by Luciano Sclovsky on 25/05/2018.
//  Copyright © 2018 Luciano Sclovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let firstButton = UIButton()
    let secondButton = UIButton()

    var snippet: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubviews()
        createConstraints()
        createSnippets()
    }
    
    func createSubviews() {
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubviews([firstButton, secondButton])
    }
    
    func createConstraints() {
        let dict: [String: Any] = [
            "btn1": firstButton,
            "btn2": secondButton,
            ]
        activateConstraints("V:|-100-[btn1(50)]-20-[btn2(50)]", views: dict)
        activateConstraints("H:[btn1(150)]", views: dict)
        firstButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.width], to: firstButton)
    }
    
    func createSnippets() {
        snippet = [
            "id": 1,
            "title": "UIButton change text",
            "links": [
                "https://stackoverflow.com/questions/1033763/is-it-possible-to-update-uibutton-title-text-programmatically"
            ]
        ]
        // testing code in snippet
        firstButton.setTitle("1000 Snippets", for: .normal)
        firstButton.setTitle("Pressed", for: .highlighted)
        
        snippet = [
            "id": 2,
            "title": "UIButton change font name",
            "links": [
                "https://stackoverflow.com/questions/25002017/how-to-change-font-of-uibutton-with-swift"
            ]
        ]
        firstButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        
        // TODO: snippet for color
        snippet = [
            "id": 3,
            "title": "UIButton change font color",
            "links": [
                "https://stackoverflow.com/questions/2474289/how-can-i-change-uibutton-title-color",
                "https://stackoverflow.com/questions/2474289/how-can-i-change-uibutton-title-color2"
            ]
        ]
        firstButton.setTitleColor(.blue, for: .normal)
        firstButton.setTitleColor(.red, for: .highlighted)
        
        snippet = [
            "id": 4,
            "title": "UIButton change background color"
        ]
        firstButton.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        
        snippet = [
            "id": 5,
            "title": "UIButton rounded corners",
            "links": [
                "https://stackoverflow.com/questions/38874517/how-to-make-a-simple-rounded-button-in-storyboard"
            ]
        ]
        firstButton.layer.cornerRadius = 10
        firstButton.clipsToBounds = true
        
        secondButton.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        secondButton.setTitle("Disabled", for: .normal)
        secondButton.setTitleColor(.gray, for: .disabled)
        
        snippet = [
            "id": 6,
            "title": "UIButton set state enabled",
            "links": [
                "https://stackoverflow.com/questions/405134/manually-setting-a-uibutton-state"
            ]
        ]
        secondButton.isEnabled = false
        
        // TODO:
        // button isSelected
        // button - radio
        // UIColor extension, named color
        // UIButtonExtension, with corner radius, etc
        
    }

}

