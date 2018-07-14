//
//  ViewController.swift
//  testHideNavBar
//
//  Created by ITCODE on 20/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var extendedView: UIView!
    @IBOutlet weak var extendedViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func tappedHideEVBtn(sender: AnyObject) {
        print("tapped hide button");
        self.extendedViewHeightConstraint.constant = self.extendedViewHeightConstraint.constant == 0 ? extendedViewDefaultHeight! : 0
//        self.EVTableVerticalSpaceConstraint.constant = self.EVTableVerticalSpaceConstraint.constant == 0 ? extendedViewDefaulVerticalSpacing! : 0
        self.view.setNeedsLayout()
        
        // Bonus: animating change
        UIView.animateWithDuration(0.3) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBOutlet weak var EVTableVerticalSpaceConstraint: NSLayoutConstraint!
    var lastContentOffset: CGFloat = 0
    
    var extendedViewOriginFrame: CGRect!
    var extendedViewDefaultHeight: CGFloat!
    var extendedViewDefaulVerticalSpacing: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        
        extendedViewOriginFrame = extendedView.frame
        print("origin = y:\(extendedViewOriginFrame.origin.y), h:\(extendedViewOriginFrame.size.height)")
        extendedViewDefaultHeight = extendedViewHeightConstraint.constant
        extendedViewDefaulVerticalSpacing = EVTableVerticalSpaceConstraint.constant
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        print("tableView.frame.origin.y = \(tableView.frame.origin.y)")
        if (self.lastContentOffset > scrollView.contentOffset.y) {
//            print("move to top") //show stuff
//            self.navigationController?.setNavigationBarHidden(false, animated: true)
            
            if self.extendedViewHeightConstraint.constant != extendedViewDefaultHeight {
                print("need to show")
                self.extendedViewHeightConstraint.constant = extendedViewDefaultHeight
                self.view.setNeedsLayout()
                
                // Bonus: animating change
                UIView.animateWithDuration(0.3) { () -> Void in
                    self.view.layoutIfNeeded()
                }
            }
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
//            print("move to bottom") //hide stuff
//            self.navigationController?.setNavigationBarHidden(true, animated: true)
            if self.extendedViewHeightConstraint.constant > 0 {
                print("need to hide")
                self.extendedViewHeightConstraint.constant = 0
                self.view.setNeedsLayout()
                
                // Bonus: animating change
                UIView.animateWithDuration(0.3) { () -> Void in
                    self.view.layoutIfNeeded()
                }
            }
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Cell row \(indexPath.row)"
        
        return cell
    }
}