//
//  ViewController.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 4 conform the protocol here
class ClassAVC: UIViewController, ClassBVCDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let vc = segue.destination as! ClassBVC
        vc.delegate = self
    }
    
    //MARK: step 6 finally use the method of the contract
    func changeBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }

    
    
    
}
