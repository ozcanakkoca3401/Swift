//
//  ViewController.swift
//  Refactoring
//
//  Created by Can on 09/06/2017.
//  Copyright © 2017 Can. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NetworkConnectivityChecking, PopUpPresentable {
	@IBOutlet weak var downloadButton: UIButton!
	@IBOutlet weak var imageView: UIImageView!
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		guard isNetworkConnectivityAvailable() else {
			downloadButton.tintColor = UIColor.gray
			
			presentPopUp()
			
			return
		}
	}
	
	@IBAction func downloadButtonAction(_ sender: UIButton) {
		guard isNetworkConnectivityAvailable() else {
			presentPopUp()
			
			return
		}
		
		imageView.downloadFrom("https://www.nasa.gov/sites/default/files/thumbnails/image/nhq201707280011.jpg") { [unowned self] in
			self.downloadButton.isHidden = true
		}
	}
}

