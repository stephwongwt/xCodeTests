//
//  OverlayView.swift
//  testRedirection
//
//  Created by ITCODE on 9/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

// this is the base for the blurred background
// need to create another class for the overlay modal itself.

import UIKit

class OverlayView: UIView { // level 1
    
    var visualEffectView: UIVisualEffectView!
//    var modalContainerView: UIView!  // level 2
    
    var modalView: UIView! // level 3
    
    var containerView: UIView! // level 4
    var scrollView: UIScrollView! // level 5
    var contentView: UIView! // level 6
    var imageView: UIImageView! // level 7
    var activityIndicator: UIActivityIndicatorView!
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
        
        
        // need to set items first before constraints
        imageView.backgroundColor = UIColor.cyanColor()
        imageView.image = image
        textLabel.text = text
        
        
        
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
        imageView.heightAnchor.constraintEqualToConstant(250).active = true
        // textlabel / textView
        textLabel.topAnchor.constraintEqualToAnchor(imageView.bottomAnchor, constant: 10).active = true
        contentView.bottomAnchor.constraintEqualToAnchor(textLabel.bottomAnchor, constant: 10).active = true
        textLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor).active = true
        contentView.trailingAnchor.constraintEqualToAnchor(textLabel.trailingAnchor).active = true
        
        
        
        
        // constraints - BOTH
        //  containerView & divider & controlView - super = modalView
        modalView.bottomAnchor.constraintEqualToAnchor(controlView.bottomAnchor).active = true
        controlView.leadingAnchor.constraintEqualToAnchor(modalView.leadingAnchor, constant: 20).active = true
        modalView.trailingAnchor.constraintEqualToAnchor(controlView.trailingAnchor, constant: 20).active = true
        // containerView
        containerView.topAnchor.constraintEqualToAnchor(modalView.topAnchor, constant: 20).active = true
        containerView.leadingAnchor.constraintEqualToAnchor(modalView.leadingAnchor, constant: 20).active = true
        modalView.trailingAnchor.constraintEqualToAnchor(containerView.trailingAnchor, constant: 20).active = true
        // activityIndicator
        activityIndicator.centerXAnchor.constraintEqualToAnchor(containerView.centerXAnchor).active = true
        let activityToContainer = activityIndicator.topAnchor.constraintEqualToAnchor(containerView.bottomAnchor, constant: 5)
        activityToContainer.active = true
        // divider
        let dividerToActivity = divider.topAnchor.constraintEqualToAnchor(activityIndicator.bottomAnchor, constant: 15)
        dividerToActivity.active = true
        divider.leadingAnchor.constraintEqualToAnchor(modalView.leadingAnchor).active = true
        modalView.trailingAnchor.constraintEqualToAnchor(divider.trailingAnchor).active = true
        divider.heightAnchor.constraintEqualToConstant(1).active = true
        // controlView
        controlView.topAnchor.constraintEqualToAnchor(divider.bottomAnchor).active = true
        let controlViewHeightContraint = controlView.heightAnchor.constraintEqualToConstant(55)
        controlViewHeightContraint.priority = 1000
        controlViewHeightContraint.active = false
        
        
        
        if enableControl! {
            activityIndicator.hidden = true
            activityToContainer.active = false
            dividerToActivity.active = false
            
            divider.topAnchor.constraintEqualToAnchor(containerView.bottomAnchor, constant: 15).active = true
            controlViewHeightContraint.active = true
            
            // color divider
            divider.backgroundColor = UIColor.orangeColor()
            
            // create - CONTROL
            checkButton = UIButton(type: .System)
            checkButtonLabel = UILabel()
            closeButton = UIButton(type: .System)
            
            // setup - CONTROL
            checkButton.setTitle("", forState: UIControlState.Normal)
            checkButton.setImage(nil, forState: UIControlState.Normal)
            checkButton.backgroundColor = UIColor.lightGrayColor()
            checkButton.layer.cornerRadius = 5.0
//            checkButton.layer.borderColor = UIColor(hex: 0xCCCCCC).CGColor
            checkButton.layer.borderColor = UIColor.lightGrayColor().CGColor
            checkButton.layer.borderWidth = 1.0
            
            checkButtonLabel.text = "Don't show this again"
            checkButtonLabel.font = UIFont(name: "Arial", size: 10)
            checkButtonLabel.textColor = UIColor.lightGrayColor()
            checkButtonLabel.sizeToFit()
            
            closeButton.setTitle("CLOSE", forState: UIControlState.Normal)
            closeButton.tintColor = UIColor.darkGrayColor()
            
            
            // add subview - CONTROL
            controlView.addSubview(checkButton)
            controlView.addSubview(checkButtonLabel)
            controlView.addSubview(closeButton)
            
            // disable auto masking - CONTROL
            checkButton.translatesAutoresizingMaskIntoConstraints = false
            checkButtonLabel.translatesAutoresizingMaskIntoConstraints = false
            closeButton.translatesAutoresizingMaskIntoConstraints = false
            
            // constraints - CONTROL
            // checkButton - super = controlView
            controlView.centerYAnchor.constraintEqualToAnchor(checkButton.centerYAnchor).active = true
            checkButton.leadingAnchor.constraintEqualToAnchor(controlView.leadingAnchor).active = true
            checkButton.widthAnchor.constraintEqualToConstant(25).active = true
            checkButton.heightAnchor.constraintEqualToConstant(25).active = true
            // checkButtonLabel - super = controlView
            checkButtonLabel.centerYAnchor.constraintEqualToAnchor(checkButton.centerYAnchor).active = true
            checkButtonLabel.leadingAnchor.constraintEqualToAnchor(checkButton.trailingAnchor, constant: 10).active = true
            // closeButton - super = controlView
            closeButton.centerYAnchor.constraintEqualToAnchor(controlView.centerYAnchor).active = true
            controlView.trailingAnchor.constraintEqualToAnchor(closeButton.trailingAnchor).active = true
            closeButton.heightAnchor.constraintEqualToConstant(25).active = true
            
        }
    }

    func loadView() {
        
        // create - modalView
        modalView = UIView() // it is THE overlay
        
        // setup - modalView
        modalView.backgroundColor = UIColor.whiteColor()
        
        // add subview - modalView
        self.addSubview(modalView)
        
        
        // diable translatesAutoresizingMaskIntoConstraints - modalView
        modalView.translatesAutoresizingMaskIntoConstraints = false
        
        // add constraints - modalView
        modalView.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 50).active = true
        self.bottomAnchor.constraintEqualToAnchor(modalView.bottomAnchor, constant: 50).active = true
        modalView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 30).active = true
        self.trailingAnchor.constraintEqualToAnchor(modalView.trailingAnchor, constant: 30).active = true
        
        
        // create - CONTAINER
        containerView = UIView()
        scrollView = UIScrollView()
        contentView = UIView()
        imageView = UIImageView()
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
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
        imageView.contentMode = .ScaleAspectFit
        
        activityIndicator.color = UIColor.purpleColor()
        
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .ByWordWrapping
        textLabel.textAlignment = .Left
        textLabel.font = UIFont(name: "Arial", size: 17.0)
        textLabel.textColor = UIColor.blackColor()
        
        // setup - DIVIDER
        divider.backgroundColor = UIColor.darkGrayColor()
        
        // setup - CONTROL
        controlView.backgroundColor = UIColor.clearColor()
        
        
        
        // add subview - BOTH
        modalView.addSubview(containerView)
        modalView.addSubview(activityIndicator)
        modalView.addSubview(divider)
        modalView.addSubview(controlView)
        
        // add subview - CONTAINER
        containerView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        //        contentView.addSubview(textView)
        
        
        
        // disable auto masking - ALL
        containerView.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        controlView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        //        textView.translatesAutoresizingMaskIntoConstraints = false
    }
}
