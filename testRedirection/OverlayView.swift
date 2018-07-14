//
//  OverlayView.swift
//  testRedirection
//
//  Created by ITCODE on 9/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

// uses the blur view as a base

import UIKit

class OverlayView: UIView { // level 2
    
    // try without this first
//    var constrainedView: UIView! // level 3
    
    var containerView: UIView! // level 4
    var scrollView: UIScrollView! // level 5
    var contentView: UIView! // level 6
    var imageView: UIImageView! // level 7
//    var textView: UITextView! // level 7
    var textLabel: UILabel! // level 7
    
    var divider: UIView! // level 4
    
    var controlView: UIView! // level 4
    var checkButton: UIButton! // level 5
    var checkButtonLabel: UILabel! // level 5
    var closeButton: UIButton! // level 5

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    convenience init(text: String, image: UIImage? = nil, enableControl: Bool? = true) {
        self.init()
        loadView()
        
        // maybe need to move all the constraints stuff to after this
        imageView.image = image
        
        
        if enableControl! {
            // color divider
            divider.backgroundColor = UIColor.orangeColor()
            
            // create - CONTROL
            checkButton = UIButton(type: .System)
            checkButtonLabel = UILabel()
            closeButton = UIButton(type: .System)
            
            // add subview - CONTROL
            controlView.addSubview(checkButton)
            controlView.addSubview(checkButtonLabel)
            controlView.addSubview(closeButton)
            
            // disable auto masking - CONTROL
            checkButton.translatesAutoresizingMaskIntoConstraints = false
            controlView.translatesAutoresizingMaskIntoConstraints = false
            closeButton.translatesAutoresizingMaskIntoConstraints = false
            
            // constraints - CONTROL
                // checkButton - super = controlView
            checkButton.centerYAnchor.constraintEqualToAnchor(controlView.centerYAnchor).active = true
            checkButton.widthAnchor.constraintEqualToConstant(25).active = true
            checkButton.heightAnchor.constraintEqualToConstant(25).active = true
                // checkButtonLabel - super = controlView
            checkButtonLabel.centerYAnchor.constraintEqualToAnchor(controlView.centerYAnchor).active = true
            checkButtonLabel.leadingAnchor.constraintEqualToAnchor(checkButton.trailingAnchor, constant: 5).active = true
                // closeButton - super = controlView
            closeButton.centerYAnchor.constraintEqualToAnchor(controlView.centerYAnchor).active = true
            closeButton.heightAnchor.constraintEqualToConstant(25).active = true
            
        }
    }
    
    func loadView() {
        // create - CONTAINER
        containerView = UIView()
        scrollView = UIScrollView()
        contentView = UIView()
        imageView = UIImageView()
        textLabel = UILabel()
//        textView = UITextView()
        
        // create - DIVIDER
        divider = UIView()
        
        // create - CONTROL
        controlView = UIView()
        
        
        
        // setup - CONTAINER
        containerView.backgroundColor = UIColor.clearColor()
        
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.showsHorizontalScrollIndicator = false
        
        contentView.backgroundColor = UIColor.clearColor()
        
        imageView.backgroundColor = UIColor.clearColor()
        imageView.contentMode = .ScaleToFill
        
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .ByWordWrapping
        textLabel.textAlignment = .Left
        textLabel.font = UIFont(name: "Arial", size: 17.0)
        textLabel.textColor = UIColor.blackColor()
        
        // setup - DIVIDER
        divider.backgroundColor = UIColor.whiteColor()
        
        // setup - CONTROL
        controlView = UIView()
        
        
        
        // add subview - BOTH
        self.addSubview(containerView)
        self.addSubview(divider)
        self.addSubview(controlView)
        
        // add subview - CONTAINER
        containerView.addSubview(scrollView)
        containerView.addSubview(contentView)
        containerView.addSubview(imageView)
        containerView.addSubview(textLabel)
//        containerView.addSubview(textView)
        
        
        
        // disable auto masking - ALL
        containerView.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        controlView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        textView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // constraints - BOTH
            //  containerView & divider & controlView - super = self
                // containerView
        containerView.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 20).active = true
        containerView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 20).active = true
        self.trailingAnchor.constraintEqualToAnchor(containerView.trailingAnchor, constant: 20).active = true
                // divider
        divider.topAnchor.constraintEqualToAnchor(containerView.bottomAnchor, constant: 10).active = true
        divider.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        self.trailingAnchor.constraintEqualToAnchor(divider.trailingAnchor).active = true
        divider.heightAnchor.constraintEqualToConstant(1).active = true
                // controlView
        controlView.topAnchor.constraintEqualToAnchor(divider.bottomAnchor).active = true
        self.bottomAnchor.constraintEqualToAnchor(controlView.bottomAnchor, constant: 15).active = true
        controlView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 15).active = true
        self.trailingAnchor.constraintEqualToAnchor(controlView.trailingAnchor, constant: 15).active = true
        
        
        
        // constraints - CONTAINER
            //  scrollView - super = containerView
        scrollView.topAnchor.constraintEqualToAnchor(containerView.topAnchor).active = true
        containerView.bottomAnchor.constraintEqualToAnchor(scrollView.bottomAnchor).active = true
        scrollView.leadingAnchor.constraintEqualToAnchor(containerView.leadingAnchor).active = true
        containerView.trailingAnchor.constraintEqualToAnchor(scrollView.trailingAnchor).active = true
        contentView.widthAnchor.constraintEqualToAnchor(containerView.widthAnchor).active = true
        
            //  contentView - super = scrollView
        contentView.topAnchor.constraintEqualToAnchor(scrollView.topAnchor).active = true
        scrollView.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor).active = true
        contentView.leadingAnchor.constraintEqualToAnchor(scrollView.leadingAnchor).active = true
        scrollView.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor).active = true
        
            //  image & text - super = contentView
                // imageView
        imageView.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        imageView.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor).active = true
        contentView.trailingAnchor.constraintEqualToAnchor(imageView.trailingAnchor).active = true
        imageView.heightAnchor.constraintEqualToConstant(150)
                // textlabel / textView
        textLabel.topAnchor.constraintEqualToAnchor(imageView.bottomAnchor).active = true
        contentView.bottomAnchor.constraintEqualToAnchor(textLabel.bottomAnchor, constant: 10).active = true
        textLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor).active = true
        contentView.trailingAnchor.constraintEqualToAnchor(textLabel.trailingAnchor).active = true
        
    }
}
