//
//  main.swift
//  Projet 3 : RPG
//
//  Created by Frederick Port on 01/08/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//
import Foundation
// Function to ask the user to enter a Int number
func input() -> Int {
    let strData = readLine()
    return Int(strData!)!
}

func actionFighter() {
    // Function that displays the possible actions to execute
    print("what do you want to do ?")
    print("1. Attack")
    print("2. Treat")
}

// Variables that will be used to determine the players' choices
var choice: Int

// initialization of the game, creation of the 2 teams and the variable numbersOfLaps
var teamP1: [Characters] = []
var teamP2: [Characters] = []
var numberOfLaps: Int = 0

// We ask the players which characters they want to select in their team
// Player 1 draft selection
for i in 1...3 {
    print("Player 1: select your fighter number \(i)")
    repeat {
        // Print charactere selection
        fighterChoice()
        choice = input()
        // if choice is different of the charactere selection
        if choice != 1 && choice != 2 && choice != 3 {
            fighterNoExist()
        }
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
    // The empty print function adds space to the console text
    print()
}

// Player 2 Draft selection
for i in 1...3 {
    print("Player 2: select your fighter number \(i)")
    repeat {
        fighterChoice()
        choice = input()
        if choice != 1 && choice != 2 && choice != 3 {
            fighterNoExist()
        }
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

// Battle Start, players play while one team is K.O
var lifeTeamP1 = teamP1[0].life + teamP1[1].life + teamP1[2].life
var lifeTeamP2 = teamP2[0].life + teamP2[1].life + teamP2[2].life


while lifeTeamP1 > 0 && lifeTeamP2 > 0 {
    var attacker: Characters!
    var defender: Characters!
    
    // Player 1 Lap
    repeat {
        numberOfLaps += 1
        print("Laps  \(numberOfLaps)")
        // Player 1 select a fighter
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
        if choice != 1 && choice != 2 && choice != 3 {
            print("this fighter do not exist !")
        }
    } while choice != 1 && choice != 2 && choice != 3;
    
    
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
    // Player 1 decides what to do
    repeat {
        actionFighter()
        choice = input()
        print()
        
    }while choice != 1 && choice != 2
    // If the player 1 decides to attack, he chooses a target of the team of the player 2
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
            if choice != 1 && choice != 2 && choice != 3 {
                fighterNoExist()
            }
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
            // if attacker is K.O, he can't attack
            print("Attacker is KO, no Attack")
            print()
        } else {
            // else the fighter attack
            attacker.battle(versus: defender)
            print()
        }
    } else {
        // else the player 1 decides to treat
        attacker.treat(attacker: attacker)
        print()
    }
    print()
    
    // This condition allows not to play the player 2 if all his characters team are K.O
    if lifeTeamP2 > 0 {
        // Player 2 Lap
        repeat {
            // Player 2 select a fighter
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
                // If the player 2 decides to attack, he chooses a target of the team of the player 1
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
                if choice != 1 && choice != 2 && choice != 3 {
                    fighterNoExist()
                }
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
                // if attacker is K.O, he can't attack
                print("Attacker is KO, no Attack")
                print()
            } else {
                // // else the fighter attack
                attacker.battle(versus: defender)
                print()
            }
        } else {
            // else the player 1 decides to treat
            attacker.treat(attacker: attacker)
            print()
        }
    }
}

// The winner is
let winner: String

if lifeTeamP1 > 0 {
    winner = "Player 1"
} else {
    winner = "Player 2"
}

// Winner is printing
print("the Winner is " + winner + " !")
print("Number of laps : \(numberOfLaps)")
print()
for personnage in teamP1 {
    print(personnage.desc())
}
for personnage in teamP2 {
    print(personnage.desc())
}

// End of the game
print("Game Over")
