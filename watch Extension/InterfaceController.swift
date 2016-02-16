//
//  InterfaceController.swift
//  watch Extension
//
//  Created by Matt on 16/02/2016.
//  Copyright © 2016 dotsoft. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    let groupID = "group.co.dotsoft.test"
    var sharedFilePath: String?
    var sharedDefaults: NSUserDefaults?
    @IBOutlet var imageView: WKInterfaceImage!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // FileManager:
        let sharedContainer = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier(groupID)
        let dirPath = sharedContainer?.path
        sharedFilePath = dirPath?.stringByAppendingString("test.data")
        
        // Configure interface objects here.
        loadTestData();
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func loadTestData() {
        print("- Watch Extionsion -");
        // User Defaults:
        sharedDefaults = NSUserDefaults.init(suiteName: groupID);
        sharedDefaults?.synchronize();
        let str = sharedDefaults?.valueForKey("test")
        print(str);
        
        // file:
        if NSFileManager.defaultManager().fileExistsAtPath(sharedFilePath!) {
            let databuffer = NSFileManager.defaultManager().contentsAtPath(sharedFilePath!)
            
            self.imageView.setImageData(databuffer)

        }else {
            print("image file is not exist");
        }

        
    }
    

}
