//
//  Characters.swift
//  RPG Fight
//
//  Created by Frederick Port on 23/07/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation
class Characters {
    // Attributs
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
        // Generation d'un chiffre aléatoire entre 0 et 9
        let number = Int(arc4random_uniform(9))
        // Si le chiffre généré est inférieur ou égale à 3, apparition du coffre magique
        if number <= 3 {
            // Selection aléatoire de la nouvelle arme
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
        // Le defenseur reçoit les dégâts
        defender.receveidDamage(weaponDamage: weapon.weaponDamage)
    }
    
    func receveidDamage(weaponDamage: Int) {
        // Reception de dommages suite à une attaque
        life = life - weaponDamage
        if life < 0 {
        // Si le personnage à des points de vie négatif, les points de vie restent à zero
            life = 0
        }
    }
    
    func treat (attacker: Characters) {
        // Si l'attaquant est KO, il ne reçoit pas de point de vie
        if attacker.life <= 0 {
            print("Fighter is KO, no recovery point")
            print()
            attacker.life += 0
        } else {
            // sinon l'attaquant reçoit 5 points de vie
            attacker.life += 5
            print("life + 5pts  - life point: \(attacker.life)")
        }
    }
    
    func desc() {
        // Description du combattant
        print("Name : " + self.name + " - Life: \(self.life)")
        print("Weapon : \(self.weapon.weaponName)" + " - Weapon Damage: \(self.weapon.weaponDamage)")
    }
}


