//
//  LoadingOverlay.swift
//
//  Created by Igor de Oliveira Sa on 25/03/15.
//  Copyright (c) 2015 Igor de Oliveira Sa. All rights reserved.
//
//  Usage:
//
//  # Show Overlay
//  LoadingOverlay.shared.showOverlay(self.navigationController?.view)
//
//  # Hide Overlay
//  LoadingOverlay.shared.hideOverlayView()

import UIKit
import Foundation


public class LoadingOverlay{
    
    var overlayView = UIView()
    var modalView: ModalView!
    var activityIndicator = UIActivityIndicatorView()
    
//    class var shared: LoadingOverlay {
//        struct Static {
//            static let instance: LoadingOverlay = LoadingOverlay()
//        }
//        return Static.instance
//    }
    
    static var shared = LoadingOverlay()
    
    public func showOverlay(view: UIView!) {
        overlayView = UIView(frame: UIScreen.mainScreen().bounds)
        overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
//        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
//        activityIndicator.center = overlayView.center
//        overlayView.addSubview(activityIndicator)
//        activityIndicator.startAnimating()
        
        modalView = ModalView(frame: overlayView.frame)
        
        modalView.imageView.image = UIImage(named: "potato")
        modalView.imageView.contentMode = UIViewContentMode.ScaleAspectFit
        modalView.imageHeight.constant = 250
        
        modalView.textView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n\n Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n\n Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n\n Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n\n Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        modalView.buttonLeft.setTitle("", forState: UIControlState.Normal)
        modalView.buttonLeft.layer.cornerRadius = 5.0
        modalView.buttonLeft.layer.borderColor = UIColor.orangeColor().CGColor
        modalView.buttonLeft.layer.borderWidth = 1.0
        modalView.buttonLeft.addTarget(self, action: #selector(LoadingOverlay.stopShowAgain(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        modalView.buttonRight.addTarget(self, action: #selector(LoadingOverlay.shared.hideOverlayView), forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(overlayView)
        overlayView.addSubview(modalView)
    }
    
    @objc public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
    
    @objc public func stopShowAgain(button: UIButton) {
        print("stop from showing again")
        button.backgroundColor = UIColor.redColor()
    }
}