//
//  ViewController.swift
//  1000 Snippets
//
//  Created by Luciano Sclovsky on 25/05/2018.
//  Copyright © 2018 Luciano Sclovsky. All rights reserved.
//

import UIKit

// TODO - snippet at top level
extension UIButton {
    convenience init(_ title: String = "") {
        self.init(type: .custom)
        setTitle(title, for: .normal)
        setTitleColor(.blue, for: .normal)
        setTitleColor(.red, for: .selected)
        // TODO color name
        backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class ViewController: UIViewController {

    let firstButton = UIButton()
    let secondButton = UIButton()
    
    let aButton = UIButton("a")
    let bButton = UIButton("b")
    let cButton = UIButton("c")

    var snippet: [String: Any] = [:]
    
    var currentButton: UIButton!
    
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
        view.addSubviews([firstButton, secondButton, aButton, bButton, cButton])
    }
    
    func createConstraints() {
        let dict: [String: Any] = [
            "btn1": firstButton,
            "btn2": secondButton,
            "aBtn": aButton,
            "bBtn": bButton,
            "cBtn": cButton,
            ]
        activateConstraints("V:|-100-[btn1(50)]-20-[btn2(50)]-20-[aBtn]", views: dict)
        activateConstraints("H:[btn1(150)]", views: dict)
        activateConstraints("H:|-20-[aBtn(50)]-20-[bBtn]-20-[cBtn]", views: dict)
        firstButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.width], to: firstButton)
        bButton.equalConstraints([.top, .width], to: aButton)
        cButton.equalConstraints([.top, .width], to: aButton)
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

        snippet = [
            "id": 7,
            "title": "UIButton set state selected",
            "links": [
                "https://stackoverflow.com/questions/25944791/how-to-change-the-state-of-an-uibutton-in-ios-using-swift"
            ]
        ]
        aButton.isSelected = true
        
        currentButton = aButton
        
        snippet = [
            "id": 8,
            "title": "UIButton add target action for touchUpInside",
            "links": [
                "https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift"
            ]
        ]
        aButton.addTarget(self, action:#selector(self.buttonPressed), for: .touchUpInside)

        bButton.addTarget(self, action:#selector(self.buttonPressed), for: .touchUpInside)
        cButton.addTarget(self, action:#selector(self.buttonPressed), for: .touchUpInside)

        // TODO:
        // button - radio
        // UIColor extension, named color
        // UIButtonExtension, with corner radius, etc
        // revisar link do snippet 8: "https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift"

    }

    @objc func buttonPressed(sender: UIButton!) {
        if currentButton != sender {
            currentButton.isSelected = false
            sender.isSelected = true
            currentButton = sender
        }
    }
    
}

