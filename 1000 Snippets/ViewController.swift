//
//  ViewController.swift
//  1000 Snippets
//
//  Created by Luciano Sclovsky on 25/05/2018.
//  Copyright © 2018 Luciano Sclovsky. All rights reserved.
//

import UIKit


// TODO:
// button - radio
// UIColor extension, named color
// UIButtonExtension, with corner radius, etc
// revisar link do snippet 8: "https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift"

// FREE ICONS:
// <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
// For apps:
// Place the attribution on the credits/description page of the application.

// TODO - change to new class when doing UILabel snippets
//extension UILabel {
//    convenience init(_ text: String = "") {
//        self.init()
//        self.text = text
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//}

// TODO color name - name, extension
/*
 _ = Snippet( 15, "UIButton convenience init", [
])
*/
//extension UIButton {
//    convenience init(_ title: String = "", tag: Int = 0) {
//        self.init(type: .custom)
//        setTitle(title, for: .normal)
//        setTitleColor(.blue, for: .normal)
//        setTitleColor(.red, for: .selected)
//        backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
//        translatesAutoresizingMaskIntoConstraints = false
//        self.tag = tag
//    }
//}

// TODO: review snippets 13 and 14

/*
_ = Snippet( 13, "UIButton image and text aligned horizontally full line extension", [
    "https://stackoverflow.com/questions/33033737/add-rightview-in-uibutton",
    "https://medium.com/@harmittaa/uibutton-with-label-text-and-right-aligned-image-a9d0f590bba1",
    "https://stackoverflow.com/questions/17800288/autolayout-intrinsic-size-of-uibutton-does-not-include-title-insets"
])
*/
class HorizButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}

/*
_ = Snippet( 14, "UIButton image and text aligned vertically extension", [
    "https://stackoverflow.com/questions/4201959/label-under-image-in-uibutton",
    "https://stackoverflow.com/questions/34682737/button-with-image-and-text-vertically-aligned-using-autolayout-constraints"
])
*/
class VertButton: UIButton {
    var padding: CGFloat = 5.0 {
        didSet {
            setNeedsLayout()
        }
    }
    override var intrinsicContentSize: CGSize {
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        if let titleSize = titleLabel?.sizeThatFits(maxSize), let imageSize = imageView?.sizeThatFits(maxSize) {
            let width = ceil(max(imageSize.width, titleSize.width))
            let height = ceil(imageSize.height + titleSize.height + padding)
            return CGSize(width: width, height: height)
        }
        return super.intrinsicContentSize
    }
    override func layoutSubviews() {
        if let image = imageView?.image, let title = titleLabel?.attributedText {
            let imageSize = image.size
            let titleSize = title.size()
            titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + padding), 0.0)
            imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + padding), 0.0, 0.0, -titleSize.width)
        }
        super.layoutSubviews()
    }
}

/*
_ = Snippet( 20, "UIButton responding to touch with closure (class)", [
    "https://stackoverflow.com/questions/37903243/swift-programmatically-create-function-for-button-with-a-closure"
    "https://stackoverflow.com/questions/25919472/adding-a-closure-as-target-to-a-uibutton",
    "https://medium.com/@jackywangdeveloper/swift-the-right-way-to-add-target-in-uibutton-in-using-closures-877557ed9455",
    "https://stackoverflow.com/questions/35550966/swift-add-show-action-to-button-programmatically"
])
*/
class ClosureButton: UIButton {
    var closure: (() -> Void)?
    func onTouched(closure: @escaping () -> Void) {
        self.closure = closure
        self.addTarget(self, action: #selector(ClosureButton.buttonTouched), for: .touchUpInside)
    }
    @objc func buttonTouched() {
        closure?()
    }
}

class ViewController: UIViewController {

    let firstButton = UIButton()
    let secondButton = UIButton()
    
    let aButton = UIButton("a", tag: 1)
    let bButton = UIButton("b", tag: 2)
    let cButton = UIButton("c", tag: 3)

    let tagButton = UIButton("tag")
    let sizeButton = UIButton("Very large title text")
    let twoLinesButton = UIButton("Foobar")

    let lblTag = UILabel("Tag")

    let horizButton = HorizButton()
    let vertButton = VertButton()
    let closureButton = ClosureButton("10", tag: 10)
    
    let btn22 = UIButton("btn22")
    let btn22a = UIButton("tap")

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
        horizButton.translatesAutoresizingMaskIntoConstraints = false
        vertButton.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubviews([firstButton, secondButton, aButton, bButton, cButton, tagButton, lblTag,
                          horizButton, vertButton, sizeButton, twoLinesButton, closureButton, btn22, btn22a])
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
            "imgBtn": horizButton,
            "imgBtn2": vertButton,
            "sizeBtn": sizeButton,
            "twoLBtn": twoLinesButton,
            "cloBtn": closureButton,
            "btn22": btn22,
            "btn22a": btn22a
            ]
        activateConstraints("V:|-100-[btn1(50)]-20-[btn2(50)]-20-[aBtn(50)]-20-[tag]-20-[imgBtn(40)]-20-[imgBtn2(80)]-[cloBtn]-[btn22]", views: dict)
        activateConstraints("V:[twoLBtn(80)]", views: dict)
        activateConstraints("H:[btn1(150)]", views: dict)
        activateConstraints("H:|-20-[aBtn(80)]-20-[bBtn]-20-[cBtn]-20-[lbl]", views: dict)
        activateConstraints("H:|-[imgBtn]-|", views: dict)
        activateConstraints("H:|-[imgBtn2]-20-[sizeBtn]-[twoLBtn(50)]", views: dict)
        activateConstraints("H:|-[btn22]-[btn22a]", views: dict)
        firstButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.centerX], to: view)
        secondButton.equalConstraints([.width], to: firstButton)
        bButton.equalConstraints([.top, .width, .height], to: aButton)
        cButton.equalConstraints([.top, .width, .height], to: aButton)
        tagButton.equalConstraints([.left, .width], to: aButton)
        lblTag.equalConstraints([.centerY], to: aButton)
        horizButton.equalConstraints([.left], to: aButton)
        vertButton.equalConstraints([.left, .width], to: aButton)
        sizeButton.equalConstraints([.top], to: vertButton)
        twoLinesButton.equalConstraints([.top], to: vertButton)
        closureButton.equalConstraints([.left, .width], to: aButton)
        btn22a.equalConstraints([.top], to: btn22)
    }
    
    func createSnippets() {
        
        _ = Snippet( 1, "UIButton change text", [
            "https://stackoverflow.com/questions/1033763/is-it-possible-to-update-uibutton-title-text-programmatically"
        ])
        firstButton.setTitle("1000 Snippets", for: .normal)
        firstButton.setTitle("Pressed", for: .highlighted)
        
        _ = Snippet( 2, "UIButton change font name", [
            "https://stackoverflow.com/questions/25002017/how-to-change-font-of-uibutton-with-swift"
        ])
        firstButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        
        _ = Snippet( 3, "UIButton change font color", [
            "https://stackoverflow.com/questions/2474289/how-can-i-change-uibutton-title-color"
        ])
        firstButton.setTitleColor(.blue, for: .normal)
        firstButton.setTitleColor(.red, for: .highlighted)
        
        // TODO: snippets for color

        _ = Snippet( 4, "UIButton change background color", [
        ])
        firstButton.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        
        _ = Snippet( 5, "UIButton rounded corners", [
            "https://stackoverflow.com/questions/38874517/how-to-make-a-simple-rounded-button-in-storyboard"
        ])
        firstButton.layer.cornerRadius = 10
        firstButton.clipsToBounds = true
        
        secondButton.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        secondButton.setTitle("Disabled", for: .normal)
        secondButton.setTitleColor(.gray, for: .disabled)
        
        _ = Snippet( 6, "UIButton set state enabled", [
            "https://stackoverflow.com/questions/405134/manually-setting-a-uibutton-state"
        ])
        secondButton.isEnabled = false

        _ = Snippet( 7, "UIButton set state selected", [
            "https://stackoverflow.com/questions/25944791/how-to-change-the-state-of-an-uibutton-in-ios-using-swift"
        ])
        aButton.isSelected = true
        
        currentButton = aButton
        
        _ = Snippet( 8, "UIButton add target action for touchUpInside", [
            "https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift",
            "http://rshankar.com/different-ways-to-connect-ibaction-to-uibutton/"
        ])
        aButton.addTarget(self, action:#selector(self.buttonPressed), for: .touchUpInside)

        bButton.addTarget(self, action:#selector(self.buttonPressed), for: .touchUpInside)
        cButton.addTarget(self, action:#selector(self.buttonPressed), for: .touchUpInside)

        tagButton.addTarget(self, action:#selector(self.viewWithTag), for: .touchUpInside)
        
        _ = Snippet( 11, "UIButton set image for state", [
            "https://stackoverflow.com/questions/26837371/how-to-change-uibutton-image-in-swift"
        ])
        aButton.setImage(UIImage(named: "1-2-3"), for: .normal)
        
        bButton.setImage(UIImage(named: "1-2-3"), for: .normal)
        
        _ = Snippet( 12, "UIButton padding right to image and before text", [
            "https://stackoverflow.com/questions/5363789/giving-a-text-margin-padding-to-the-uibutton-on-the-iphone"
        ])
        bButton.imageEdgeInsets.right = 10
        
        // TODO - review - use init
        // for snippet 13
        horizButton.setImage(UIImage(named: "1-2-3"), for: .normal)
        horizButton.setTitle("image", for: .normal)
        horizButton.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        horizButton.setTitleColor(.blue, for: .normal)

        // TODO - review - use init
        // for snipppet 14
        vertButton.setImage(UIImage(named: "1-2-3"), for: .normal)
        vertButton.setTitle("image2", for: .normal)
        vertButton.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        vertButton.setTitleColor(.blue, for: .normal)
        
        _ = Snippet( 16, "UIButton size to fit", [
            "https://stackoverflow.com/questions/4135032/ios-uibutton-resize-according-to-text-length",
            "https://stackoverflow.com/questions/39283525/easiest-way-to-adjust-uibutton-size-based-on-text"
        ])
        sizeButton.sizeToFit()
        
        // for snippet 17
        sizeButton.addTarget(self, action:#selector(self.sizeButtonPressed), for: .touchUpInside)
        
        _ = Snippet( 18, "UIButton set attributed title", [
            "https://stackoverflow.com/questions/29045750/attributed-text-center-alignment"
        ])
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font: UIFont.init(name: "Baskerville", size: 18.0)!,
            NSAttributedStringKey.foregroundColor: UIColor.purple,
            NSAttributedStringKey.paragraphStyle: paragraph
        ]
        let title = NSAttributedString(string: "foobar", attributes: attributes)
        horizButton.setAttributedTitle(title, for: .normal)
        
        _ = Snippet( 19, "UIButton multi line title", [
            "https://stackoverflow.com/questions/30679370/swift-uibutton-with-two-lines-of-text"
        ])
        twoLinesButton.setTitle("foo\nbar", for: .normal)
        twoLinesButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        _ = Snippet( 21, "UIButton responding to touch with closure (closure)", [
        ])
        closureButton.onTouched { [weak self] in
            guard let self = self else { return }
            self.closureButton.tag = self.closureButton.tag + 1
            self.closureButton.setTitle(String(self.closureButton.tag), for: .normal)
        }
        
        // for snippet 22
        btn22.addTarget(self, action:#selector(self.btn22Touched), for: .touchUpInside)
        btn22a.addTarget(self, action:#selector(self.btn22aTouched), for: .touchUpInside)
        
    }

    @objc func viewWithTag(sender: UIButton!) {
        
        _ = Snippet( 9, "UIView viewWithTag get view by tag", [
            "https://stackoverflow.com/questions/28473893/referencing-a-uibutton-by-tag-value"
        ])
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
        
        _ = Snippet( 10, "UIView use view (sender) tag", [
            "https://stackoverflow.com/questions/30046540/get-button-pressed-id-on-swift-via-sender"
        ])
        lblTag.text = "Tag: \(sender.tag)"
        
    }
    
    @objc func sizeButtonPressed(sender: UIButton!) {
        
        _ = Snippet( 17, "UIButton image with tint color", [
            "https://stackoverflow.com/questions/19829356/color-tint-uibutton-image",
            "https://stackoverflow.com/questions/27163171/change-color-of-png-in-buttons-ios"
        ])
        vertButton.setImage(UIImage(named: "1-2-3")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: .normal)
        vertButton.tintColor = .red
        
    }
    
    @objc func btn22Touched(sender: UIButton!) {
        btn22.setTitle("ok", for: .normal)
    }
    
    @objc func btn22aTouched(sender: UIButton!) {
        
        _ = Snippet( 22, "UIButton touched event called programatically", [
            "https://stackoverflow.com/questions/36465953/programmatically-tap-uibutton-swift",
            "https://stackoverflow.com/questions/39336562/how-to-click-a-button-programmatically"
        ])
        btn22.sendActions(for: .touchUpInside)
        
    }
    
}

