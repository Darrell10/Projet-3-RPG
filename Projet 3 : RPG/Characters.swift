//
//  Characters.swift
//  RPG Fight
//
//  Created by Frederick Port on 23/07/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation
class Characters {
    var name: String
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
        // Mise a jour des vies des personnages
        lifeTeamP1 = teamP1[0].life + teamP1[1].life + teamP1[2].life
        lifeTeamP2 = teamP2[0].life + teamP2[1].life + teamP2[2].life
    }
    
    func attack(defender: Characters) {
        // Apparition aléatoire du coffre
        let number = Int(arc4random_uniform(9))
        if number <= 3 {
            let armeNumber = Int(arc4random_uniform(2)+1)
            if armeNumber == 1 {
                self.weapon = Sword ()
            } else if armeNumber == 2 {
                self.weapon = Arrow ()
            } else if armeNumber == 3 {
                self.weapon = Axe()
            }
            print("Appearance of a magic chest")
            print("New weapon get: \(self.weapon.weaponName)")
            print()
        }
        defender.receveidDamage(weaponDamage: weapon.weaponDamage)
    }
    
    func receveidDamage(weaponDamage: Int) {
        life = life - weaponDamage
        if life < 0 {
            life = 0
        }
    }
    
    func treat (attacker: Characters) {
        if attacker.life <= 0 {
            print("Fighter is KO, no recovery point")
            print()
            attacker.life += 0
        } else {
            attacker.life += 5
            print("life + 5pts  - life point = \(attacker.life)")
        }
    }
    
    func desc() {
        print("Name : " + self.name + " - Life : \(self.life)")
        print("Weapon : \(self.weapon.weaponName)" + " - Weapon Damage: \(self.weapon.weaponDamage)")
    }
}


