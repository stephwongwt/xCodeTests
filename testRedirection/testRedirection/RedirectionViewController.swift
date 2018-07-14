//
//  RedirectionViewController.swift
//  testRedirection
//
//  Created by ITCODE on 8/6/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class RedirectionViewController: UIViewController {
    
    var imageView: UIImageView!
//    var textView: UITextView!
    var myLabel: UILabel!
    var activityIndicator: UIActivityIndicatorView!
    
    var link: String!
    
    required init?(coder aDecoder: NSCoder) {
        print("RedirectionViewController init coder")
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        print("RedirectionViewController init nib")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        //create
        let image = UIImage(named: "logo")
        imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        myLabel = UILabel()
        myLabel.backgroundColor = UIColor(red: 0.5, green: 0.3, blue: 0.2, alpha: 0.5)
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam varius urna vitae leo efficitur, fringilla consequat erat sagittis. Praesent molestie laoreet purus, quis eleifend risus viverra non. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed non dignissim nulla."
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicator.color = UIColor.purpleColor()
        
        //add subviews
        self.view.addSubview(activityIndicator)
        self.view.addSubview(myLabel)
        self.view.addSubview(imageView)
        
        //constraints
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let viewMargins = self.view.layoutMarginsGuide
    
        imageView.heightAnchor.constraintEqualToConstant(image!.size.height*2).active = true
        imageView.topAnchor.constraintEqualToAnchor(viewMargins.topAnchor, constant: 100).active = true
        imageView.leadingAnchor.constraintEqualToAnchor(viewMargins.leadingAnchor, constant: 50).active = true
        viewMargins.trailingAnchor.constraintEqualToAnchor(imageView.trailingAnchor, constant: 50).active = true

        myLabel.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
//        myLabel.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        myLabel.widthAnchor.constraintEqualToAnchor(viewMargins.widthAnchor).active = true
        myLabel.topAnchor.constraintEqualToAnchor(imageView.bottomAnchor, constant: 75).active = true
//        myLabel.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -200).active = true
        
        activityIndicator.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        activityIndicator.topAnchor.constraintEqualToAnchor(myLabel.bottomAnchor, constant: 50).active = true
        
        
        activityIndicator.startAnimating()
        
        // show the link
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.dismissViewControllerAnimated(false, completion: {
                self.activityIndicator.stopAnimating()
                if let url = NSURL(string: self.link) {
                    UIApplication.sharedApplication().openURL(url)
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
