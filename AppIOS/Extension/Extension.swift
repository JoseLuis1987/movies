//
//  Extension.swift
//  AppIOS
//
//  Created by IOS DEVELOPER on 04/05/18.
//  Copyright © 2018 IOS DEVELOPER. All rights reserved.
//

import Foundation
extension Data
{
    func toString() -> String
    {
        return String(data: self, encoding: .utf8)!
    }
}
