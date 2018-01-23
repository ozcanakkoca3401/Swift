//
//  MasterViewController.swift
//  SplitViewController
//
//  Created by Özcan AKKOCA on 15.06.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        navigationItem.leftItemsSupplementBackButton = true
        // dikey çalıştığında back buttonunun olması
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
