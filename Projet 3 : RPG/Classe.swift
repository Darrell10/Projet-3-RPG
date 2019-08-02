//
//  Classe.swift
//  RPG Fight V2
//
//  Created by Frederick Port on 29/07/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation
enum Classe {
    case Archer
    case Warriors
    case Knight
}

func fighterChoice() {
    // liste des personnages à choisir
    print("1. Archer - Life point: 30 pts - Weapon: Arrow - Weapon Damage: 8")
    print("2. Warrior - Life point: 20 pts - Weapon: Axe - Weapon Damage: 15")
    print("3. Knight - Life point: 25 pts - Weapon: Sword - Weapon Damage: 10")
}
