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

// TODO: review snippets 13 and 14's Classes

/*
_ = Snippet( 13, "UIButton image and text aligned horizontally full line extension")
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
_ = Snippet( 14, "UIButton image and text aligned vertically extension")
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

// TODO color name - name, extension
/*
 _ = Snippet( 15, "UIButton convenience init")
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


/*
_ = Snippet( 20, "UIButton responding to touch with closure (class)")
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

// helper method
extension UIButton {
    func tagPlusOneToTitle() {
        tag = tag + 1
        setTitle("\(tag)", for: .normal)
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
    let btn6c = UIButton("")

    let btn7a = UIButton("")
    let btn7b = ClosureButton("0", tag: 0)
    let btn7c = UIButton("->")
    let btn7d = UIButton("0", tag: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        createSubviews()
        createConstraints()
        createSnippets()
    }

    func createSubviews() {
        btn1a.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubviews([btn1a, btn1b, btn2a,
                          btn2b, btn2c, lbl2, btn2t,
                          btn3a, btn3b,
                          btn4h,
                          btn5v, btn5b,
                          btn6a, btn6b, btn6c,
                          btn7a, btn7b, btn7c, btn7d])
    }
    
    func createConstraints() {
        let dict: [String: Any] = [
            "btn1a": btn1a, "btn1b": btn1b,
            "btn2a": btn2a, "btn2b": btn2b, "btn2c": btn2c, "lbl2": lbl2, "btn2t": btn2t,
            "btn3a": btn3a, "btn3b": btn3b,
            "btn4h": btn4h,
            "btn5v": btn5v, "btn5b": btn5b,
            "btn6a": btn6a, "btn6b": btn6b, "btn6c": btn6c,
            "btn7a": btn7a, "btn7b": btn7b, "btn7c": btn7c, "btn7d": btn7d
        ]

        activateConstraints("V:|-50-[btn1a(50)]-[btn2a(50)]-[btn3a(50)]-[btn4h(50)]-[btn5v(80)]-[btn6a(50)]-[btn7a(80)]", views: dict)
        
        activateConstraints("H:|-[btn1a(150)]-10-[btn1b]", views: dict)
        activateConstraints("H:|-[btn2a(60)]-[btn2b]-[btn2c]-[btn2t]-[lbl2]", views: dict)
        activateConstraints("H:|-[btn3a(100)]-[btn3b]", views: dict)
        activateConstraints("H:|-[btn4h]-|", views: dict)
        activateConstraints("H:|-[btn5v(100)]-[btn5b]", views: dict)
        activateConstraints("H:|-[btn6a(100)]-[btn6b]-[btn6c]", views: dict)
        activateConstraints("H:|-[btn7a(80)]-[btn7b(60)]-[btn7c]-[btn7d]", views: dict)

        btn1b.equalConstraints([.width, .top, .height], to: btn1a)
        
        btn2b.equalConstraints([.width, .top, .height], to: btn2a)
        btn2c.equalConstraints([.width, .top, .height], to: btn2a)
        btn2t.equalConstraints([.width, .top, .height], to: btn2a)
        lbl2.equalConstraints([.width, .top, .height], to: btn2a)
        
        btn3b.equalConstraints([.width, .top, .height], to: btn3a)

        btn5b.equalConstraints([.top], to: btn5v)

        btn6b.equalConstraints([.width, .top, .height], to: btn6a)
        btn6c.equalConstraints([.width, .top, .height], to: btn6a)

        btn7b.equalConstraints([.top, .height], to: btn7a)
        btn7c.equalConstraints([.width, .top, .height], to: btn7b)
        btn7d.equalConstraints([.width, .top, .height], to: btn7b)
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
        snippet18()
        snippet19()
        snippet21()
        snippet22()
    }
    
    func snippets1to5() {
        
        _ = Snippet( 1, "UIButton change text")
        btn1a.setTitle("1st Snippet", for: .normal)
        btn1a.setTitle("Highlighted", for: .highlighted)
        
        _ = Snippet( 2, "UIButton change font name")
        btn1a.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17.0)
        
        _ = Snippet( 3, "UIButton change font color")
        btn1a.setTitleColor(.blue, for: .normal)
        btn1a.setTitleColor(.red, for: .highlighted)

        // TODO: snippets for color - replace UIColor.init

        _ = Snippet( 4, "UIButton change background color")
        btn1a.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        
        _ = Snippet( 5, "UIButton rounded corners")
        btn1a.layer.cornerRadius = 10
        btn1a.clipsToBounds = true
        
    }

    func snippet6() {
        
        _ = Snippet( 6, "UIButton set state enabled")
        btn1b.isEnabled = false
        
    }
    
    func snippets7to8() {
        
        _ = Snippet( 7, "UIButton set state selected")
        btn2a.isSelected = true
        
        currentButton = btn2a
        
        _ = Snippet( 8, "UIButton add target action for touchUpInside")
        btn2a.addTarget(self, action:#selector(self.btn3xPressed), for: .touchUpInside)
        
        btn2b.addTarget(self, action:#selector(self.btn3xPressed), for: .touchUpInside)
        btn2c.addTarget(self, action:#selector(self.btn3xPressed), for: .touchUpInside)

    }
    
    func snippet9() {
        btn2t.addTarget(self, action:#selector(self.btnWithTag2), for: .touchUpInside)
    }
    
    @objc func btnWithTag2(sender: UIButton!) {
        
        _ = Snippet( 9, "UIView viewWithTag get view by tag")
        if let button = self.view.viewWithTag(2) as? UIButton {
            btn3xPressed(sender: button)
        }
        
    }
    
    @objc func btn3xPressed(sender: UIButton!) {
        if currentButton != sender {
            currentButton.isSelected = false
            sender.isSelected = true
            currentButton = sender
        }
        
        _ = Snippet( 10, "UIView use view (sender) tag")
        lbl2.text = "Tag: \(sender.tag)"
        
    }
    
    func snippet11() {
        
        _ = Snippet( 11, "UIButton set image for state")
        btn3a.setImage(UIImage(named: "1-2-3"), for: .normal)
        
    }

    func snippet12() {
        
        btn3b.setImage(UIImage(named: "1-2-3"), for: .normal)
        
        _ = Snippet( 12, "UIButton padding right to image and before text")
        btn3b.imageEdgeInsets.right = 10

    }
    
    func snippet16() {
        
        _ = Snippet( 16, "UIButton size to fit")
        btn5b.sizeToFit()

    }
    
    func snippet17() {
        btn6a.addTarget(self, action:#selector(self.changeBtnImageTint), for: .touchUpInside)
    }
    
    @objc func changeBtnImageTint(sender: UIButton!) {
        
        _ = Snippet( 17, "UIButton image with tint color")
        btn6b.setImage(UIImage(named: "1-2-3")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate), for: .normal)
        btn6b.tintColor = .blue
        
    }

    func snippet18() {
        
        _ = Snippet( 18, "UIButton set attributed title")
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.font: UIFont.init(name: "Baskerville", size: 18.0)!,
            NSAttributedStringKey.foregroundColor: UIColor.purple,
            NSAttributedStringKey.paragraphStyle: paragraph
        ]
        let title = NSAttributedString(string: "Attributed", attributes: attributes)
        btn6c.setAttributedTitle(title, for: .normal)

    }
    
    func snippet19() {

        _ = Snippet( 19, "UIButton multi line title")
        btn7a.setTitle("Multi\nLine", for: .normal)
        btn7a.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping

    }
    
    func snippet21() {
        
        _ = Snippet( 21, "UIButton responding to touch with closure (closure)")
        btn7b.onTouched { [weak self] in
            self?.btn7b.tagPlusOneToTitle()
        }

    }
    
    func snippet22() {
        
        btn7c.addTarget(self, action:#selector(self.btn7cTouched), for: .touchUpInside)
        btn7d.addTarget(self, action:#selector(self.btn7dTouched), for: .touchUpInside)

    }
    
    @objc func btn7cTouched(sender: UIButton!) {
        
        _ = Snippet( 22, "UIButton touched event called programatically")
        btn7d.sendActions(for: .touchUpInside)
        
    }

    @objc func btn7dTouched(sender: UIButton!) {
        btn7d.tagPlusOneToTitle()
    }
    
}
