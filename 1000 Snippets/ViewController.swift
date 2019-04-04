//
//  ViewController.swift
//  1000 Snippets
//
//  Created by Luciano Sclovsky on 25/05/2018.
//  Copyright © 2018 Luciano Sclovsky. All rights reserved.
//

import UIKit


// TODO: BUG - extra bracket on some snippets!

// TODO:
// button - radio
// UIColor extension, named color
// UIButtonExtension, with corner radius, etc
// revisar link do snippet 8: "https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift"

// FREE ICONS:
// <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
// For apps:
// Place the attribution on the credits/description page of the application.


// TODO - snippet at top level
extension UIButton {
    convenience init(_ title: String = "", tag: Int = 0) {
        self.init(type: .custom)
        setTitle(title, for: .normal)
        setTitleColor(.blue, for: .normal)
        setTitleColor(.red, for: .selected)
        // TODO color name
        backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        translatesAutoresizingMaskIntoConstraints = false
        self.tag = tag
    }
}

extension UILabel {
    convenience init(_ text: String = "") {
        self.init()
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// WIP SNIPPET 13
class ButtonWithImage: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}

class ViewController: UIViewController {

    let firstButton = UIButton()
    let secondButton = UIButton()
    
    let aButton = UIButton("a", tag: 1)
    let bButton = UIButton("b", tag: 2)
    let cButton = UIButton("c", tag: 3)
    
    let tagButton = UIButton("tag")
    
    let lblTag = UILabel("Tag")

    let imageButton = ButtonWithImage()

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
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubviews([firstButton, secondButton, aButton, bButton, cButton, tagButton, lblTag, imageButton])
    }
    
    func createConstraints() {
        let dict: [String: Any] = [
            "btn1": firstButton,
            "btn2": secondButton,
            "aBtn": aButton,
            "bBtn": bButton,
            "cBtn": cButton,
            "tag": tagButton,
            "lbl": lblTag,
            "imgBtn": imageButton
            ]
        activateConstraints("V:|-100-[btn1(50)]-20-[btn2(50)]-20-[aBtn(50)]-20-[tag]-20-[imgBtn(40)]", views: dict)
        activateConstraints("H:[btn1(150)]", views: dict)
        activateConstraints("H:|-20-[aBtn(80)]-20-[bBtn]-20-[cBtn]-20-[lbl]", views: dict)
        activateConstraints("H:|-[imgBtn]-|", views: dict)
        firstButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.width], to: firstButton)
        bButton.equalConstraints([.top, .width, .height], to: aButton)
        cButton.equalConstraints([.top, .width, .height], to: aButton)
        tagButton.equalConstraints([.left, .width], to: aButton)
        lblTag.equalConstraints([.centerY], to: aButton)
        imageButton.equalConstraints([.left], to: aButton)
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
        
        // TODO: snippets for color

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

        tagButton.addTarget(self, action:#selector(self.viewWithTag), for: .touchUpInside)
        
        snippet = [
            "id": 11,
            "title": "UIButton set image for state",
            "links": [
                "https://stackoverflow.com/questions/26837371/how-to-change-uibutton-image-in-swift"
            ]
        ]
        aButton.setImage(UIImage(named: "1-2-3"), for: .normal)
        
        bButton.setImage(UIImage(named: "1-2-3"), for: .normal)
        
        snippet = [
            "id": 12,
            "title": "UIButton padding right to image and before text",
            "links": [
                "https://stackoverflow.com/questions/5363789/giving-a-text-margin-padding-to-the-uibutton-on-the-iphone"
            ]
        ]
        bButton.imageEdgeInsets.right = 10
        
        // WIP SNIPPET 13
        imageButton.setImage(UIImage(named: "1-2-3"), for: .normal)
        imageButton.setTitle("image", for: .normal)
        imageButton.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        imageButton.setTitleColor(.blue, for: .normal)

    }

    @objc func viewWithTag(sender: UIButton!) {
        
        snippet = [
            "id": 9,
            "title": "UIView viewWithTag get view by tag",
            "links": [
                "https://stackoverflow.com/questions/28473893/referencing-a-uibutton-by-tag-value"
            ]
        ]
        if let button = self.view.viewWithTag(2) as? UIButton {
            buttonPressed(sender: button)
        }
        
    }

    @objc func buttonPressed(sender: UIButton!) {
        if currentButton != sender {
            currentButton.isSelected = false
            sender.isSelected = true
            currentButton = sender
        }
        
        snippet = [
            "id": 10,
            "title": "UIView use view (sender) tag",
            "links": [
                "https://stackoverflow.com/questions/30046540/get-button-pressed-id-on-swift-via-sender"
            ]
        ]
        lblTag.text = "Tag: \(sender.tag)"
        
    }


    
}

