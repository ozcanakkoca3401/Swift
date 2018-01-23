//
//  Network.swift
//  Refactoring
//
//  Created by Can Sürmeli on 25/08/2017.
//  Copyright © 2017 Can. All rights reserved.
//

import SystemConfiguration

// Not to be used but just for observing
final class Network {
	func isNetworkConnectivityAvailable() -> Bool {
		var zeroAddress = sockaddr_in()
		zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
		zeroAddress.sin_family = sa_family_t(AF_INET)
		
		let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
			$0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
				SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
			}
		}
		
		var flags = SCNetworkReachabilityFlags()
		
		if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
			return false
		}
		
		let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
		let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
		
		return (isReachable && !needsConnection)
	}
}
