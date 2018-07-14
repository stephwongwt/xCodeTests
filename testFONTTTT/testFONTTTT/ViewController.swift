//
//  ViewController.swift
//  testFONTTTT
//
//  Created by ITCODE on 6/9/16.
//  Copyright © 2016 incinemas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let text = "<font color='grey'><h3><strong>Disney's Pete's Dragon Giveaway</strong></h3></font><br>Cinemas is giving away 50 goodie bags worth $120!<br><br><i>Contest ends 30th Sep.</i><br><br>Participate now by clicking on the tab in the Settings Page!"
        
        textLbl.attributedText = text.html2AttributedString
//        textLbl.font = UIFont(name: "Barmeno-Regular", size: 17.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension String {
    
    var html2AttributedString: NSAttributedString? {
        guard
            let data = dataUsingEncoding(NSUTF8StringEncoding)
            else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSUTF8StringEncoding, NSFontAttributeName:UIFont(name: "Barmeno-Regular", size: 17.0)!], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}