//
//  ViewController.swift
//  Bitcoin
//
//  Created by ElectronicArmory on 9/23/17.
//  Copyright © 2017 Electronic Armory. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    
    static let kBPI = "bpi"
    static let kUSD = "USD"
    static let kRATE = "rate_float"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        priceLabel.text = "..."
        
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON{ response in
            print(response)
            
            if let bitcoinJSON = response.result.value {
                let bitcoinObject:Dictionary = bitcoinJSON as! Dictionary<String, Any>
                
                let bpiObject:Dictionary = bitcoinObject[ViewController.kBPI] as! Dictionary<String, Any>
                let usdObject:Dictionary = bpiObject[ViewController.kUSD] as! Dictionary<String, Any>
                let rate:Float = usdObject[ViewController.kRATE] as! Float
                
                
                self.priceLabel.text = "$\(rate)"
                
            }
        }
        
        print("Loading web service")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

