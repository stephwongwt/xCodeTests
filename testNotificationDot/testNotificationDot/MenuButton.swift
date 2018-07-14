//
//  MenuButton.swift
//  testNotificationDot
//
//  Created by ITCODE on 1/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

@IBDesignable class MenuButton: UIView {
    
    var view: UIView!
    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var dot: UIView!
    
//    @IBInspectable var image: UIImage? {
//        get {
//            return button.imageView!.image
//        }
//        set(image) {
//            button.imageView!.image = image
//        }
//    }
//
//    @IBInspectable var title: String? {
//        get {
//            return button.titleLabel?.text
//        }
//        set(title) {
//            button.titleLabel?.text = title
//        }
//    }
    
    var notify: Bool {
        get {
            return dot.hidden
        }
        set(notify) {
            dot.hidden = notify
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    
    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        self.addSubview(view)
        
        dot.layer.cornerRadius = 3.0
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MenuButton", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func addTarget(target: AnyObject?, action: Selector, forControlEvents: UIControlEvents) {
        button.addTarget(target, action: action, forControlEvents: forControlEvents)
    }
}
