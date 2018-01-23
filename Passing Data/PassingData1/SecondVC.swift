//
//  SecondVC.swift
//  PassingData1
//
//  Created by Umut Karagoz on 30.05.2017.
//  Copyright © 2017 Umut Karagoz. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    var stringPassed=""
    var intPassed=Int()
    var theImagePassed=UIImage()
    
    @IBOutlet weak var imagePassed: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondLabel.text = stringPassed+"my Int: \(intPassed)"
        imagePassed.image=theImagePassed
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
