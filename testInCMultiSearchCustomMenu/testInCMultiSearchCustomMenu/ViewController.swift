//
//  ViewController.swift
//  testInCMultiSearchCustomMenu
//
//  Created by ITCODE on 16/8/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: CustomMultiSelectionMenu!
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBAction func touchUpBigButton(sender: AnyObject) {
        self.performSegueWithIdentifier("showShowtimes", sender: self)
    }
    
    @IBOutlet weak var containerView: UIView!
    var mainSubView: AnyObject!
    
    var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        print("unwind unwind")
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
        print("view did load")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createStackView()
//        scrollView.contentInset 
        
        // set active vc
        if let titleText = stackView.selectedOption.titleLabel?.text {
            print("stackview selectedoption has title = \(titleText)")
            switch titleText {
            case "By Movies":
                setupMainVC(titleText)
                break
            case "By Cinemas":
                setupSecondVC(titleText)
                break
            case "By Location":
                setupMainVC(titleText)
                break
            case "By Map":
                setupSecondVC(titleText)
                break
            case "By Movie Poster":
                setupMainVC(titleText)
                break
            default:
                break
            }
        } else {
            setupMainVC("Selected Button has no title")
        }
    }
    
    func setupMainVC(titleText: String) {
        print("setupMainVC")
        // set up view in containerview
        mainSubView = MainViewController()
        activeViewController = MainViewController()
        if let avc = activeViewController as? MainViewController {
            avc.mainLabel.text = titleText
            
            // set up subview buttons
            avc.newButton.addTarget(self, action: #selector(ViewController.touchUpNewButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            avc.buttonOne.addTarget(self, action: #selector(ViewController.touchUpButtonOne(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            avc.buttonTwo.addTarget(self, action: #selector(ViewController.touchUpButtonTwo(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            avc.buttonThree.addTarget(self, action: #selector(ViewController.touchUpButtonThree(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    func setupSecondVC(titleText: String) {
        print("setupSecondVC")
        // set up view in containerview
        mainSubView = SecondViewController()
        activeViewController = SecondViewController()
        let avc = activeViewController as! SecondViewController
        avc.mainLabel.text = titleText
        
        // set up subview buttons
        avc.buttonOne.addTarget(self, action: #selector(ViewController.touchUpButtonOne(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        avc.buttonTwo.addTarget(self, action: #selector(ViewController.touchUpButtonTwo(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        avc.buttonThree.addTarget(self, action: #selector(ViewController.touchUpButtonThree(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func createStackView() {
        print("createStackView")
        
        scrollView.contentInset = UIEdgeInsetsMake(0.0, 15.0, 0.0, 15.0)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
//        stackView = UIStackView(frame: scrollView.frame)
        stackView = CustomMultiSelectionMenu(frame: scrollView.frame, parentvc: self)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .Horizontal
        stackView.alignment = .Center
        stackView.spacing = 15
        
        scrollView.addSubview(stackView)
        
        scrollView.leadingAnchor.constraintEqualToAnchor(stackView.leadingAnchor, constant: 0.0).active = true
        scrollView.topAnchor.constraintEqualToAnchor(stackView.topAnchor, constant: 0.0).active = true
        scrollView.bottomAnchor.constraintEqualToAnchor(stackView.bottomAnchor, constant: 0.0).active = true
        scrollView.trailingAnchor.constraintEqualToAnchor(stackView.trailingAnchor, constant: 0.0).active = true
        
        scrollView.centerYAnchor.constraintEqualToAnchor(stackView.centerYAnchor, constant: 0.0).active = true
    }
    
    func touchUpNewButton(sender: AnyObject) {
        print("touchUpNewButton")
    }
    
    func touchUpButtonOne(sender: AnyObject) {
        print("touchUpButtonOne")
        self.performSegueWithIdentifier("showTableFromVC", sender: "buttonOne")
    }
    
    func touchUpButtonTwo(sender: AnyObject) {
        print("touchUpButtonTwo")
        self.performSegueWithIdentifier("showTableFromVC", sender: "buttonTwo")
    }
    
    func touchUpButtonThree(sender: AnyObject) {
        print("touchUpButtonThree")
        self.performSegueWithIdentifier("showTableFromVC", sender: "buttonThree")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier! {
        case "showTableFromVC":
//            if segue.destinationViewController is TableViewController {
            if let tvc = segue.destinationViewController as? TableViewController {
                if let btn = sender as? String {
                    tvc.fromButton = btn
                    switch btn {
                    case "buttonOne":
                        tvc.dataArray = ["one-1","one-2","one-3","one-4"]
                        break
                    case "buttonTwo":
                        tvc.dataArray = ["two-1","two-2","two-3","two-4"]
                        break
                    case "buttonThree":
                        tvc.dataArray = ["three-1","three-2","three-3","three-4"]
                        break
                    default:
                        break
                    }
                }
            }
            break
        case "showShowtimes":
            if let nvc = segue.destinationViewController as? NextViewController {
                if let avc = activeViewController as? MainViewController {
                    nvc.valueOne = avc.labelOne.text
                    nvc.valueTwo = avc.labelTwo.text
                    nvc.valueThree = avc.labelThree.text
                } else if let avc = activeViewController as? SecondViewController {
                    nvc.valueOne = avc.labelOne.text
                    nvc.valueTwo = avc.labelTwo.text
                    nvc.valueThree = avc.labelThree.text
                }
            }
            break
        default:
            break
        }
    }
}

