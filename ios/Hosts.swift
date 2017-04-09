//
//  Hosts.swift
//  ios
//
//  Created by Armin Langhofer on 09.04.17.
//  Copyright © 2017 Armin Langhofer. All rights reserved.
//

import Foundation

final class Hosts {
    private init() { }
    static let sharedInstance: Hosts = Hosts()
    
    var hosts : Any?
    
    
}
