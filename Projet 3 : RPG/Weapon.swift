//
//  Weapon.swift
//  RPG Fight
//
//  Created by Frederick Port on 23/07/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation
class Weapon {
    
    // Attribute
    var weaponName: String
    var weaponDamage: Int
    
    init(weaponName: String, weaponDamage: Int){
        self.weaponDamage = weaponDamage
        self.weaponName = weaponName
    }
}
