//
//  ButtonViewController.swift
//  1000 Snippets
//
//  Created by Luciano Sclovsky on 14/04/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

// TODO:
// check snippets unique numbers

// TODO:
// button - radio
// UIColor extension, named color
// UIButtonExtension, with corner radius, etc
// revisar link do snippet 8: "https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift"

// FREE ICONS:
// <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
// For apps:
// Place the attribution on the credits/description page of the application.

// TEMP
// buttonPressed -> btn3xPressed
// lblTag -> lbl3

import UIKit

// TODO - change to new class when doing UILabel snippets
extension UILabel {
    convenience init(_ text: String = "") {
        self.init()
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// TODO color name - name, extension
/*
_ = Snippet( 15, "UIButton convenience init", [
])
*/
extension UIButton {
    convenience init(_ title: String = "", tag: Int = 0, image: UIImage? = nil) {
        self.init(type: .custom)
        setTitle(title, for: .normal)
        setTitleColor(.blue, for: .normal)
        setTitleColor(.red, for: .highlighted)
        setTitleColor(.purple, for: .selected)
        setTitleColor(.gray, for: .disabled)
        backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
        self.tag = tag
        if let image = image {
            setImage(image, for: .normal)
        }
    }
}

// TODO: review snippets 13 and 14's Classes

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


class ButtonViewController: UIViewController {

    let btn1a = UIButton()
    let btn1b = UIButton("Disabled")
    
    let btn2a = UIButton("a", tag: 1)
    let btn2b = UIButton("b", tag: 2)
    let btn2c = UIButton("c", tag: 3)
    let btn2t = UIButton("tag=2")
    var currentButton: UIButton!
    let lbl2 = UILabel("Tag")
    
    let btn3a = UIButton("")
    let btn3b = UIButton("3b")
    
    let btn4h = HorizButton("Horiz", image: UIImage(named: "1-2-3"))
    
    let btn5v = VertButton("Vert", image: UIImage(named: "1-2-3"))
    let btn5b = UIButton("Size to fit button")
    
    let btn6a = UIButton("Image tint")
    let btn6b = UIButton("", image: UIImage(named: "1-2-3"))

    override func viewDidLoad() {
        super.viewDidLoad()
        createSubviews()
        createConstraints()
        createSnippets()
    }

    func createSubviews() {
        btn1a.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubviews([btn1a, btn1b, btn2a, btn2b, btn2c, lbl2, btn2t, btn3a, btn3b, btn4h, btn5v, btn5b, btn6a, btn6b])
    }
    
    func createConstraints() {
        let dict: [String: Any] = [
            "btn1a": btn1a, "btn1b": btn1b,
            "btn2a": btn2a, "btn2b": btn2b, "btn2c": btn2c, "lbl2": lbl2, "btn2t": btn2t,
            "btn3a": btn3a, "btn3b": btn3b,
            "btn4h": btn4h,
            "btn5v": btn5v, "btn5b": btn5b,
            "btn6a": btn6a, "btn6b": btn6b,
        ]

        activateConstraints("V:|-50-[btn1a(50)]-[btn2a(50)]-[btn3a(50)]-[btn4h(50)]-[btn5v(80)]-[btn6a(50)]", views: dict)
        
        activateConstraints("H:|-[btn1a(150)]-10-[btn1b]", views: dict)
        activateConstraints("H:|-[btn2a(60)]-[btn2b]-[btn2c]-[btn2t]-[lbl2]", views: dict)
        activateConstraints("H:|-[btn3a(100)]-[btn3b]", views: dict)
        activateConstraints("H:|-[btn4h]-|", views: dict)
        activateConstraints("H:|-[btn5v(100)]-[btn5b]", views: dict)
        activateConstraints("H:|-[btn6a(100)]-[btn6b]", views: dict)

        btn1b.equalConstraints([.width, .top, .height], to: btn1a)
        
        btn2b.equalConstraints([.width, .top, .height], to: btn2a)
        btn2c.equalConstraints([.width, .top, .height], to: btn2a)
        btn2t.equalConstraints([.width, .top, .height], to: btn2a)
        lbl2.equalConstraints([.width, .top, .height], to: btn2a)
        
        btn3b.equalConstraints([.width, .top, .height], to: btn3a)

        btn5b.equalConstraints([.top], to: btn5v)

        btn6b.equalConstraints([.width, .top, .height], to: btn6a)
    }
    
    func createSnippets() {
        snippets1to5()
        snippet6()
        snippets7to8()
        snippet9()
        snippet11()
        snippet12()
        snippet16()
        snippet17()
    }
    
    func snippets1to5() {
        
        _ = Snippet( 1, "UIButton change text", [
            "https://stackoverflow.com/questions/1033763/is-it-possible-to-update-uibutton-title-text-programmatically"
            ])
        btn1a.setTitle("1st Snippet", for: .normal)
        btn1a.setTitle("Highlighted", for: .highlighted)
        
        _ = Snippet( 2, "UIButton change font name", [
            "https://stackoverflow.com/questions/25002017/how-to-change-font-of-uibutton-with-swift"
            ])
        btn1a.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        
        _ = Snippet( 3, "UIButton change font color", [
            "https://stackoverflow.com/questions/2474289/how-can-i-change-uibutton-title-color"
            ])
        btn1a.setTitleColor(.blue, for: .normal)
        btn1a.setTitleColor(.red, for: .highlighted)

        // TODO: snippets for color - replace UIColor.init

        _ = Snippet( 4, "UIButton change background color", [
            "https://stackoverflow.com/questions/26600980/how-do-i-set-uibutton-background-color-forstate-uicontrolstate-highlighted-in-s"
        ])
        btn1a.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        
        _ = Snippet( 5, "UIButton rounded corners", [
            "https://stackoverflow.com/questions/38874517/how-to-make-a-simple-rounded-button-in-storyboard",
            "https://stackoverflow.com/questions/17401032/set-cornerradius-and-setbackgroundimage-to-uibutton"
        ])
        btn1a.layer.cornerRadius = 10
        btn1a.clipsToBounds = true
        
    }

    func snippet6() {
        
        _ = Snippet( 6, "UIButton set state enabled", [
            "https://stackoverflow.com/questions/405134/manually-setting-a-uibutton-state"
            ])
        btn1b.isEnabled = false
        
    }
    
    func snippets7to8() {
        
        _ = Snippet( 7, "UIButton set state selected", [
            "https://stackoverflow.com/questions/25944791/how-to-change-the-state-of-an-uibutton-in-ios-using-swift"
            ])
        btn2a.isSelected = true
        
        currentButton = btn2a
        
        _ = Snippet( 8, "UIButton add target action for touchUpInside", [
            "https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift",
            "http://rshankar.com/different-ways-to-connect-ibaction-to-uibutton/"
            ])
        btn2a.addTarget(self, action:#selector(self.btn3xPressed), for: .touchUpInside)
        
        btn2b.addTarget(self, action:#selector(self.btn3xPressed), for: .touchUpInside)
        btn2c.addTarget(self, action:#selector(self.btn3xPressed), for: .touchUpInside)

    }
    
    func snippet9() {
        btn2t.addTarget(self, action:#selector(self.btnWithTag2), for: .touchUpInside)
    }
    
    func snippet11() {
        
        _ = Snippet( 11, "UIButton set image for state", [
            "https://stackoverflow.com/questions/26837371/how-to-change-uibutton-image-in-swift"
            ])
        btn3a.setImage(UIImage(named: "1-2-3"), for: .normal)
        
    }

    func snippet12() {
        
        btn3b.setImage(UIImage(named: "1-2-3"), for: .normal)
        
        _ = Snippet( 12, "UIButton padding right to image and before text", [
            "https://stackoverflow.com/questions/5363789/giving-a-text-margin-padding-to-the-uibutton-on-the-iphone"
            ])
        btn3b.imageEdgeInsets.right = 10

    }
    
    func snippet16() {
        
        _ = Snippet( 16, "UIButton size to fit", [
            "https://stackoverflow.com/questions/4135032/ios-uibutton-resize-according-to-text-length",
            "https://stackoverflow.com/questions/39283525/easiest-way-to-adjust-uibutton-size-based-on-text"
            ])
        btn5b.sizeToFit()

    }
    
    func snippet17() {
        btn6a.addTarget(self, action:#selector(self.changeBtnImageTint), for: .touchUpInside)
    }
    
    @objc func btn3xPressed(sender: UIButton!) {
        if currentButton != sender {
            currentButton.isSelected = false
            sender.isSelected = true
            currentButton = sender
        }
        
        _ = Snippet( 10, "UIView use view (sender) tag", [
            "https://stackoverflow.com/questions/30046540/get-button-pressed-id-on-swift-via-sender"
            ])
        lbl2.text = "Tag: \(sender.tag)"
        
    }
    
    @objc func btnWithTag2(sender: UIButton!) {
        
        _ = Snippet( 9, "UIView viewWithTag get view by tag", [
            "https://stackoverflow.com/questions/28473893/referencing-a-uibutton-by-tag-value"
            ])
        if let button = self.view.viewWithTag(2) as? UIButton {
            btn3xPressed(sender: button)
        }
        
    }

    @objc func changeBtnImageTint(sender: UIButton!) {
        
        _ = Snippet( 17, "UIButton image with tint color", [
            "https://stackoverflow.com/questions/19829356/color-tint-uibutton-image",
            "https://stackoverflow.com/questions/27163171/change-color-of-png-in-buttons-ios"
            ])
        btn6b.setImage(UIImage(named: "1-2-3")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: .normal)
        btn6b.tintColor = .blue
        
    }
        
}

/*

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
 
    let twoLinesButton = UIButton("Foobar")
 
    let vertButton = VertButton()
    let closureButton = ClosureButton("10", tag: 10)
    
    let btn22 = UIButton("btn22")
    let btn22a = UIButton("tap")
    
    func createSubviews() {
        horizButton.translatesAutoresizingMaskIntoConstraints = false
        vertButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews([secondButton, aButton, bButton, cButton, btn3t, lblTag,
                          horizButton, vertButton, sizeButton, twoLinesButton, closureButton, btn22, btn22a])
    }
    
    func createConstraints() {
        let dict: [String: Any] = [
            "aBtn": aButton,
            "bBtn": bButton,
            "cBtn": cButton,
            "tag": btn3t,
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
        btn3t.equalConstraints([.left, .width], to: aButton)
        lblTag.equalConstraints([.centerY], to: aButton)
        horizButton.equalConstraints([.left], to: aButton)
        vertButton.equalConstraints([.left, .width], to: aButton)
        sizeButton.equalConstraints([.top], to: vertButton)
        twoLinesButton.equalConstraints([.top], to: vertButton)
        closureButton.equalConstraints([.left, .width], to: aButton)
        btn22a.equalConstraints([.top], to: btn22)
    }
    
    func createSnippets() {
 
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

*/
