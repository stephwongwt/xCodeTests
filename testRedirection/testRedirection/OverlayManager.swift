//
//  Overlay.swift
//  InCinemasSG
//
//  Created by ITCODE on 19/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit
import Foundation

public class OverlayManager {
    var overlayManagerView = UIView()
    var overlayView: OverlayView!
    var redirectLink: String?
    
    static var sharedInstance = OverlayManager()
    
    public func showOverlay(view: UIView!, enableControl: Bool? = true, redirectLink: String? = nil) {
        self.redirectLink = redirectLink
        
        overlayManagerView = UIView(frame: UIScreen.mainScreen().bounds)
        overlayManagerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        //before assign image, need to check if it is for popupInfo or for redirection
        if redirectLink != nil {
            let image = UIImage(named: "logo")
//            let text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.\n\nLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
            let text = "You are now redirecting out of the InCinemasSg application. Anything that happens after this redirection is not under our control. All payments are handled by their respective vendors, distributors, exhibitors or organizations."
            
            
            //create the overlay view
            overlayView = OverlayView(text: text, image: image, enableControl: enableControl)
        } else {
//            let image: UIImage!
//            if let picURL = UserManager.modalPromoPicURL {
//                if let checkedUrl = NSURL(string: picURL) {
//                    incDataManager.downloadImage(checkedUrl, completionHandler: { imageData in
//                        if imageData != nil {
//                            image = UIImage(data: imageData!)
//                        }
//                    })
//                }
//            }
//            
//            let text = UserManager.modalPromoText
//                overlayView = OverlayView(text: text, image: image, enableControl: enableControl)
        }
        
        
        
        // add selectors
        if let enblControl = enableControl where enblControl {
            
            overlayView.checkButton.addTarget(self, action: #selector(OverlayManager.stopShowAgain(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    
            overlayView.closeButton.addTarget(self, action: #selector(OverlayManager.sharedInstance.hideOverlayView), forControlEvents: UIControlEvents.TouchUpInside)

        }
        
        // add subviews
        view.addSubview(overlayManagerView)
        overlayManagerView.addSubview(overlayView)
        
        // show the link
        print("self.link = \(self.redirectLink), enableControl = \(enableControl)")
        if let linkStr = self.redirectLink, let enblControl = enableControl where !enblControl {
            overlayView.activityIndicator.hidden = false
            overlayView.activityIndicator.startAnimating()
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                OverlayManager.sharedInstance.hideOverlayView()
                if let url = NSURL(string: linkStr) {
                    UIApplication.sharedApplication().openURL(url)
                }
                
                //original
//                self.dismissViewControllerAnimated(false, completion: {
//                    self.activityIndicator.stopAnimating()
//                    if let url = NSURL(string: self.link) {
//                        UIApplication.sharedApplication().openURL(url)
//                    }
//                })
            }
        }
        
        
        // set up overlayView constraints
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.topAnchor.constraintEqualToAnchor(overlayManagerView.topAnchor).active = true
        overlayManagerView.bottomAnchor.constraintEqualToAnchor(overlayView.bottomAnchor).active = true
        overlayView.leadingAnchor.constraintEqualToAnchor(overlayManagerView.leadingAnchor).active = true
        overlayManagerView.trailingAnchor.constraintEqualToAnchor(overlayView.trailingAnchor).active = true
    }
    
    func checkHeight() {
        print("checkHeight text view height: \(overlayView.checkButtonLabel.frame.height)")
    }
    
    @objc public func hideOverlayView() {
        print("hideOverlayView")
        self.overlayView.activityIndicator.stopAnimating()
        overlayManagerView.removeFromSuperview()
//        showedModalForSession = true
//        print("usermanagershowoverlay? \(UserManager.modalShowAgain)")
//        NSUserDefaults.standardUserDefaults().setBool(UserManager.modalShowAgain, forKey: "ModalShowAgain")
    }
    
    @objc func stopShowAgain(button: UIButton) { //button: UIButton
        print("stopShowAgain")
//        switch UserManager.modalShowAgain {
//        case true:
////            button.backgroundColor = UIColor.redColor()
//            UserManager.modalShowAgain = false
//            overlayView.buttonLeft.setImage(UIImage(named: "Tick"), forState: UIControlState.Normal)
//            break
//        case false:
////            button.backgroundColor = UIColor.clearColor()
//            UserManager.modalShowAgain = true
//            overlayView.buttonLeft.setImage(nil, forState: UIControlState.Normal)
//            break
//        default:
//            button.backgroundColor = UIColor.clearColor()
//            overlayView.buttonLeft.setImage(nil, forState: UIControlState.Normal)
//            break
//        }
//        
//        print("usermanagershowoverlay? \(UserManager.modalShowAgain)")
//        print("text view height: \(overlayView.contentLabel.frame.height)")
    }
}