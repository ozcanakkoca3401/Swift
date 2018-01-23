//
//  ClassBVC.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 1 Add Protocol here
protocol ClassBVCDelegate: class {
    func changeBackgroundColor(_ color: UIColor?)
}

class ClassBVC: UIViewController {
    


    //MARK: step 2 Create a delegate property here, don't forget to make it weak!
    weak var delegate: ClassBVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        delegate?.changeBackgroundColor(UIColor.red)
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}
