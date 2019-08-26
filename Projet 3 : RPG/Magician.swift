//
//  Sword.swift
//  RPG Fight V2
//
//  Created by Frederick Port on 29/07/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation
class Magician: Characters {
    init() {
        super.init(name: "", fighterType: .Magician)
    }
    
    override func battle(versus character: Characters) {
        attack(defender: character)
        desc()
    }
    
    override func attack(defender: Characters) {
        // Defender received damaged
        defender.life = defender.life - weapon.weaponDamage
        if defender.life < 0 {
            // If the character has negative life points, the points remain at zero
            defender.life = 0
        }
    }
    
    override func desc() {
        // Fighter description
        print("Name : " + self.name + " - Life: \(self.life)")
        print("Weapon : \(self.weapon.weaponName)" + " - Weapon Damage: \(self.weapon.weaponDamage)")
        
    }
    
    override func treat (attacker: Characters) {
        super.treat(attacker: attacker)
        // if attacker is K.O, he can't treat
        if attacker.life <= 0 {
            print("Fighter is KO, no recovery point")
        } else {
            // else he recovery 5 life points
            attacker.life += 5
            print("life + 5pts  - life points is now: \(attacker.life)")
        }
        print()
    }
}

