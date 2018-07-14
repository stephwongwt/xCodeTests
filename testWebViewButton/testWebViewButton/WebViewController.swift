//
//  WebViewController.swift
//  testWebViewButton
//
//  Created by ITCODE on 4/5/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    var myLink: NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let request = NSURLRequest(URL: myLink!)
        webView.loadRequest(request)
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
