//
//  ViewController.swift
//  PassingData1
//
//  Created by Umut Karagoz on 30.05.2017.
//  Copyright © 2017 Umut Karagoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var myInt=Int()
    
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myInt=5
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goButton(_ sender: Any) {
        
        //Data geçilecek olan VC burada ilke önce tanımlanır.
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        //Burada diğer VC geçilmesi istenen dataları atanır.
        myVC.stringPassed = myLabel.text!
        myVC.intPassed=myInt
        myVC.theImagePassed=myImage.image!
        
        //Atanan değerler SecondVC ye geçilir
        navigationController?.pushViewController(myVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

