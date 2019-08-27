//
//  Characters.swift
//  RPG Fight
//
//  Created by Frederick Port on 23/07/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation
class Characters {
    // Attribute
    var name: String
    let fighterType: FighterType
    var weapon: Weapon
    var life: Int
    
    init(name: String, fighterType: FighterType) {
        self.name = name
        self.fighterType = fighterType
        
        switch self.fighterType {
        case .Archer:
            self.weapon = Weapon(weaponName: "Arrow", weaponDamage: 8)
            self.life = 30
        case .Warriors:
            self.weapon = Weapon(weaponName: "Axe", weaponDamage: 15)
            self.life = 20
        case .Knight:
            self.weapon = Weapon(weaponName: "Sword", weaponDamage: 10)
            self.life = 25
        case .Magician:
            self.weapon = Weapon(weaponName: "scepter", weaponDamage: 12)
            self.life = 40
        }
    }
    // Method
    func battle(versus character: Characters) {
        attack(defender: character)
        desc()
    }
    
    func attack(defender: Characters) {
        // Defender received damaged
        defender.life = defender.life - weapon.weaponDamage
        if defender.life < 0 {
            // If the character has negative life points, the points remain at zero
            defender.life = 0
        }
    }
    
    func desc() {
        // Fighter description
        print("Name : " + self.name + " - Life: \(self.life)")
        print("Weapon : \(self.weapon.weaponName)" + " - Weapon Damage: \(self.weapon.weaponDamage)")
        
    }
    
    func treat (attacker: Characters) {
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


