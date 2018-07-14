//
//  ViewController.swift
//  testCustomContainerView
//
//  Created by ITCODE on 5/7/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //CustomContainerViewController
    @IBOutlet weak var containerView: UIView! //contentView
    
//    var firstVC: UIViewController?
//    var secondVC: UIViewController?
    var firstVC: OneViewController?
    var secondVC: TwoViewController?
    var thirdVC: ThreeViewController?
    var fourthVC: FourViewController?
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMoveToParentViewController(nil)
            
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMoveToParentViewController(self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        firstVC = UIViewController()
        firstVC = self.storyboard?.instantiateViewControllerWithIdentifier("onevc") as? OneViewController
        
//        secondVC = UIViewController()
        secondVC = self.storyboard?.instantiateViewControllerWithIdentifier("twovc") as? TwoViewController
        
        thirdVC = ThreeViewController()
        
        fourthVC = FourViewController()
        
        activeViewController = firstVC
    }
    
    @IBAction func touchUpFirstButton(sender: AnyObject) {
        activeViewController = firstVC
    }
    
    @IBAction func touchUpSecondButton(sender: AnyObject) {
        activeViewController = secondVC
    }

    @IBAction func touchUpThirdButton(sender: AnyObject) {
        activeViewController = thirdVC
    }
    
    @IBAction func touchUpForthButton(sender: AnyObject) {
        activeViewController = fourthVC
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

