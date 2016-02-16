//
//  ViewController.swift
//  watchOSTest
//
//  Created by Matt on 16/02/2016.
//  Copyright © 2016 dotsoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let groupID = "group.co.dotsoft.test"
    var sharedFilePath: String?
    var sharedDefaults: NSUserDefaults?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initTestData()
        
        testLocal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initTestData() {
        // User Defaults:
        sharedDefaults = NSUserDefaults.init(suiteName: groupID);
        sharedDefaults?.setObject("User Default Shared String", forKey: "test")
        sharedDefaults?.synchronize();
        
        
    }
    
    func testLocal() {
        print("- Local -");
        let t_sharedDefaults =  NSUserDefaults.init(suiteName: groupID);
        t_sharedDefaults?.synchronize();
        let str = t_sharedDefaults?.valueForKey("test") as! String;
        print(str);
    }


}

