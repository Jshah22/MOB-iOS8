//
//  Animal.swift
//  HW 3
//
//  Created by Jay Shah on 2/17/16.
//  Copyright © 2016 Jay Shah. All rights reserved.
//

import Foundation

class Animal: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func prettyAnimalName() -> String {
        return "Animal name: " + self.name
    }
}