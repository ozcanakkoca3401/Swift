//
//  PresentPopUp.swift
//  Refactoring
//
//  Created by Can Sürmeli on 21/08/2017.
//  Copyright © 2017 Can. All rights reserved.
//

import UIKit

extension PopUpPresentable where Self: UIViewController {
	func presentPopUp() {
		let networkUnavailableAlert = UIAlertController(title: "Network Unavailable",
		                                                message: "Your network connection seems to be offline.",
		                                                preferredStyle: .alert)
		
		let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
		networkUnavailableAlert.addAction(dismissAction)
		
		let settingsAction = UIAlertAction(title: "Settings", style: .default) { action in
			guard let settingsURL = URL(string: UIApplicationOpenSettingsURLString) else { return }
			
			if UIApplication.shared.canOpenURL(settingsURL) {
				UIApplication.shared.open(settingsURL, options: [:]) { completed in
					print("Settings opened.")
				}
			}
		}
		networkUnavailableAlert.addAction(settingsAction)
		
		present(networkUnavailableAlert, animated: true, completion: nil)
	}
}
