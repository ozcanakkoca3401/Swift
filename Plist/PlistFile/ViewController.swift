//
//  ViewController.swift
//  PlistFile
//
//  Created by Özcan AKKOCA on 5.06.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//

// Kendi .plist dosyanı oluştur
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Bu dosyayı bul Property List.plist
        if let path = Bundle.main.path(forResource: "Property List", ofType: "plist") {
            
            //If your plist contain root as Array
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                    print(array)
            }
            
            ////If your plist contain root as Dictionary
            if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
                let lazyMapCollection = dic.keys
                
                let componentArray = Array(lazyMapCollection)
                print(dic) // tamamı
                print(componentArray) // Liste isimleri
                
                print(dic["Genel"]!) // Liste detay
                
                let arr:NSArray = dic["Genel"] as! NSArray
                print(arr[0]) // Liste Detay ilk eleman
            }
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

