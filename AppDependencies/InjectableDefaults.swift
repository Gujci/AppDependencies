//
//  InjectableDefaults.swift
//  AppDependencies
//
//  Created by Gujgiczer Máté on 2016. 11. 01..
//  Copyright © 2016. gujci. All rights reserved.
//

import Foundation

public extension Injectable {
    
    static var id: String { return String(describing: Self.self) }
}
