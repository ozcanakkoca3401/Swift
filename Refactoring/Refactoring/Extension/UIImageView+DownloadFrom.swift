//
//  UIImageView+DownloadFrom.swift
//  Refactoring
//
//  Created by Can Sürmeli on 21/08/2017.
//  Copyright © 2017 Can. All rights reserved.
//

import UIKit

extension UIImageView {
	///		Fills the UIImageView with the image downloaded
	/// from the URL given.
	///
	/// - Parameter address: image download URL string
	func downloadFrom(_ address: String, completion completionBlock: (() -> ())?) {
		guard let url = URL(string: address) else { return }
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
						let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
						let data = data, error == nil,
						let image = UIImage(data: data)
				else { return }
			
			DispatchQueue.main.async {
				self.image = image
				self.contentMode = .scaleAspectFill
				self.alpha = 0.0
				
				UIView.animate(withDuration: 0.4,
				               delay: 0,
				               options: .curveEaseOut,
				               animations: {
												self.alpha = 1.0
				}, completion: { completed in
					guard let completionBlock = completionBlock else { return }
					completionBlock()
				})
			}
		}.resume()
	}
}
