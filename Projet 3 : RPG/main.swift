//
//  main.swift
//  Projet 3 : RPG
//
//  Created by Frederick Port on 01/08/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation

import Foundation
// Fonction permettant de demander à l'utilisateur d'entrer un nombre entier
func input() -> Int {
    let strData = readLine();
    
    return Int(strData!)!
}

func actionFighter() {
    // Fonction qui affiche les actions possible a éxécuter
    print("what do you want to do ?")
    print("1. Attack")
    print("2. Treat")
}

// Variables qui serviront à déterminer les choix des deux joueurs
var choice: Int

// initialisation du jeu, creation des 2 équipes et de la variable numbersOfLaps
var teamP1: [Characters] = []
var teamP2: [Characters] = []
var numberOfLaps: Int = 0

// On demande quel type de personnage les joueurs veulent choisir dans leurs équipes
// Selection du joueur 1
for i in 1...3 {
    print("Player 1: select your fighter number \(i)")
    repeat {
        fighterChoice()
        choice = input()
    } while choice != 1 && choice != 2 && choice != 3
    
    var draft1: Classe!
    switch choice {
    case 1:
        draft1 = .Archer
    case 2:
        draft1 = .Warriors
    case 3:
        draft1 = .Knight
    default:
        break
    }
    if i == 1 {
        let character1 = Characters(name: "Fighter 1", classe: draft1)
        teamP1.append(character1)
    } else if i == 2 {
        let character2 = Characters(name: "Fighter 2", classe: draft1)
        teamP1.append(character2)
    } else if i == 3 {
        let character3 = Characters(name: "Fighter 3", classe: draft1)
        teamP1.append(character3)
    }
    // La fonction print vide ajoute un espace au texte de la console
    print()
}


// Selection de l'équipe du joueur 2
for i in 1...3 {
    print("Player 2: select your fighter number \(i)")
    repeat {
        fighterChoice()
        choice = input()
    } while choice != 1 && choice != 2 && choice != 3
    
    var draft2: Classe!
    switch choice {
    case 1:
        draft2 = .Archer
    case 2:
        draft2 = .Warriors
    case 3:
        draft2 = .Knight
    default:
        break
    }
    if i == 1 {
        let character4 = Characters(name: "Fighter 4", classe: draft2)
        teamP2.append(character4)
    } else if i == 2 {
        let character5 = Characters(name: "Fighter 5", classe: draft2)
        teamP2.append(character5)
    } else if i == 3 {
        let character6 = Characters(name: "Fighter 6", classe: draft2)
        teamP2.append(character6)
    }
    print()
}


// Debut des combats, On joue tant que tous les personnages d'une équipe sont en vie
var lifeTeamP1 = teamP1[0].life + teamP1[1].life + teamP1[2].life
var lifeTeamP2 = teamP2[0].life + teamP2[1].life + teamP2[2].life
while lifeTeamP1 > 0 && lifeTeamP2 > 0 {
    var attacker: Characters!
    var defender: Characters!
    
    // Tour du joueur 1
    repeat {
        numberOfLaps += 1
        print("Laps  \(numberOfLaps)")
        // Joueur 1 choisi son attaquant
        print("Player 1: Choose your attacker")
        if teamP1[0].life <= 0 {
            print("1.KO")
            teamP1[0].weapon.weaponDamage = 0
        } else {
            print("1.\(teamP1[0].name)" + " - life : \(teamP1[0].life)" + " - Weapon : \(teamP1[0].weapon.weaponName)")
        }
        if teamP1[1].life <= 0 {
            print("2.KO")
            teamP1[1].weapon.weaponDamage = 0
        } else {
            print("2.\(teamP1[1].name)" + " - life : \(teamP1[1].life)" + " - Weapon : \(teamP1[1].weapon.weaponName)")
        }
        if teamP1[2].life <= 0 {
            print("3.KO")
            teamP1[2].weapon.weaponDamage = 0
        } else {
            print("3.\(teamP1[2].name)" + " - life : \(teamP1[2].life)" + " - Weapon : \(teamP1[2].weapon.weaponName)")
        }
        print("Total Team life : \(lifeTeamP1)")
        choice = input()
    } while choice != 1 && choice != 2 && choice != 3
    
    switch choice {
    case 1:
        attacker = teamP1[0]
    case 2:
        attacker = teamP1[1]
    case 3:
        attacker = teamP1[2]
    default:
        break
    }
    print()
    // Joueur 1 decide de l'action à faire
    repeat {
        actionFighter()
        choice = input()
        print()
        
    }while choice != 1 && choice != 2
    // Si le joueur 1 decide d'attaquer, il choisi une cible de l'équipe du joueur 2
    if choice == 1 {
        repeat {
            print("Player 1: Choose the defender !")
            if teamP2[0].life <= 0 {
                print("1.KO")
            } else {
                print("1.\(teamP2[0].name)" + " - life : \(teamP2[0].life)")
            }
            if teamP2[1].life <= 0 {
                print("2.KO")
            } else {
                print("2.\(teamP2[1].name)" + " - life : \(teamP2[1].life)")
            }
            if teamP2[2].life <= 0 {
                print("3.KO")
            } else {
                print("3.\(teamP2[2].name)" + " - life : \(teamP2[2].life)")
            }
            print("Total Team life : \(lifeTeamP2)")
            choice = input()
        } while choice != 1 && choice != 2 && choice != 3
        
        switch choice {
        case 1:
            defender = teamP2[0]
        case 2:
            defender = teamP2[1]
        case 3:
            defender = teamP2[2]
        default:
            break
        }
        print()
        if attacker.life <= 0 {
            // Si l'attaquant est KO il ne peut pas attaquer
            print("Attacker is KO, no Attack")
            print()
        } else {
            // Sinon le combattant Attaque
            attacker.battle(versus: defender)
            print()
        }
    } else {
        // Sinon l'attaquant se soigne
        attacker.treat(attacker: attacker)
        print()
    }
    print()
    
    // Cette condition permet de ne pas faire jouer le deuxième personnage si tous ses personnages sont KO
    if lifeTeamP2 > 0 {
        // Tour du joueur 2
        repeat {
            // Le joueur 2 choisi son attaquant
            print("Player 2: Choose your attacker")
            if teamP2[0].life <= 0 {
                print("1.KO")
                teamP2[0].weapon.weaponDamage = 0
            } else {
                print("1.\(teamP2[0].name)" + " - life : \(teamP2[0].life)" + " - Weapon : \(teamP2[0].weapon.weaponName)")
            }
            if teamP2[1].life <= 0 {
                print("2.KO")
                teamP2[1].weapon.weaponDamage = 0
                
            } else {
                print("2.\(teamP2[1].name)" + " - life : \(teamP2[1].life)" + " - Weapon : \(teamP2[1].weapon.weaponName)")
            }
            if teamP2[2].life <= 0 {
                print("3.KO")
                teamP2[2].weapon.weaponDamage = 0
                
            } else {
                print("3.\(teamP2[2].name)" + " - life : \(teamP2[2].life)" + " - Weapon : \(teamP2[2].weapon.weaponName)")
            }
            print("Total Team life : \(lifeTeamP2)")
            choice = input()
        } while choice != 1 && choice != 2 && choice != 3
        
        switch choice {
        case 1:
            attacker = teamP2[0]
        case 2:
            attacker = teamP2[1]
        case 3:
            attacker = teamP2[2]
        default:
            break
        }
        print()
        repeat {
            actionFighter()
            choice = input()
            print()
            
        }while choice != 1 && choice != 2
        
        if choice == 1 {
            repeat {
                // Si le joueur 2 decide d'attaquer, il choisi une cible de l'équipe du joueur 1
                print("Player 2: Choose the Defender")
                if teamP1[0].life <= 0 {
                    print("1.KO")
                } else {
                    print("1.\(teamP1[0].name)" + " - life : \(teamP1[0].life)")
                }
                if teamP1[1].life <= 0 {
                    print("2.KO")
                } else {
                    print("2.\(teamP1[1].name)" + " - life : \(teamP1[1].life)")
                }
                if teamP1[2].life <= 0 {
                    print("3.KO")
                    
                } else {
                    print("3.\(teamP1[2].name)" + " - life : \(teamP1[2].life)")
                }
                print("Total Team life : \(lifeTeamP1)")
                choice = input()
            } while choice != 1 && choice != 2 && choice != 3
            
            switch choice {
            case 1:
                defender = teamP1[0]
            case 2:
                defender = teamP1[1]
            case 3:
                defender = teamP1[2]
            default:
                break
            }
            if attacker.life <= 0 {
                // Si l'attaquant est KO il ne peut pas attaquer
                print("Attacker is KO, no Attack")
                print()
            } else {
                 // Sinon le combattant Attaque
                attacker.battle(versus: defender)
                print()
            }
        } else {
            // Sinon l'attaquant se soigne
            attacker.treat(attacker: attacker)
            print()
        }
    }
}


// On annonce le vainqueur
let winner: String

if lifeTeamP1 > 0 {
    winner = "Player 1"
} else {
    winner = "Player 2"
}

// On affiche le vainqueur
print("the Winner is " + winner + " !")
print("Number of laps : \(numberOfLaps)")
print()
for personnage in teamP1 {
    print(personnage.desc())
}
for personnage in teamP2 {
    print(personnage.desc())
}
print("Game Over")

