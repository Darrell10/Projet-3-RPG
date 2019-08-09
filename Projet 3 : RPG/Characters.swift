//
//  Characters.swift
//  RPG Fight
//
//  Created by Frederick Port on 23/07/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation
class Characters {
    // Property
    let name: String
    let classe: Classe
    var weapon: Weapon
    var life: Int
    
    init(name: String, classe: Classe) {
        self.name = name
        self.classe = classe
        
        switch self.classe {
        case .Archer:
            self.weapon = Arrow()
            self.life = 30
        case .Warriors:
            self.weapon = Axe()
            self.life = 20
        case .Knight:
            self.weapon = Sword()
            self.life = 25
        }
    }
    // Functions
    func battle(versus character: Characters) {
        attack(defender: character)
        desc()
        // Update of life team characters
        lifeTeamP1 = teamP1[0].life + teamP1[1].life + teamP1[2].life
        lifeTeamP2 = teamP2[0].life + teamP2[1].life + teamP2[2].life
    }
    
    func attack(defender: Characters) {
        // Generation of a random number between 0 and 9
        let number = Int(arc4random_uniform(9))
        // If the generated number is less than or equal to 2, appearance of the magic chest
        if number <= 2 {
            // Random selection of the new weapon
            let weaponNumber = Int(arc4random_uniform(2)+1)
            if weaponNumber == 1 {
                self.weapon = Sword ()
            } else if weaponNumber == 2 {
                self.weapon = Arrow ()
            } else if weaponNumber == 3 {
                self.weapon = Axe()
            }
            print("Appearance of a magic chest")
            print("New weapon get: \(self.weapon.weaponName)")
            print()
        }
        // Defender received damaged
        defender.receveidDamage(weaponDamage: weapon.weaponDamage)
    }
    
    func receveidDamage(weaponDamage: Int) {
        // Reception of damages following an attack
        life = life - weaponDamage
        if life < 0 {
        // If the character has negative life points, the points remain at zero
            life = 0
        }
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
    
    func desc() {
        // Fighter description
        print("Name : " + self.name + " - Life: \(self.life)")
        print("Weapon : \(self.weapon.weaponName)" + " - Weapon Damage: \(self.weapon.weaponDamage)")
    }
    
}


