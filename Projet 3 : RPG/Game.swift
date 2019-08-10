//
//  Game.swift
//  Projet 3 : RPG
//
//  Created by Frederick Port on 09/08/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//
import Foundation
class Game {
// Attribut
var choice: String?
var teamP1: [Characters]
var teamP2: [Characters]
var lifeTeamP1: Int
var lifeTeamP2: Int
var numberOfLaps: Int
    
    init(choice: String?, teamP1: [Characters], teamP2: [Characters], lifeTeamP1: Int, lifeTeamP2: Int, numberOfLaps: Int){
        self.choice = choice
        self.teamP1 = teamP1
        self.teamP2 = teamP2
        self.lifeTeamP1 = lifeTeamP1
        self.lifeTeamP2 = lifeTeamP2
        self.numberOfLaps = numberOfLaps
    }

// Methods
// Function that will be used to determine the players' choices
func input() -> String {
    let strData = readLine()
    return String(strData!)
}

func fighterChoice() {
    // list of characters to draft
    print("1. Archer - Life point: 30 pts - Weapon: Arrow - Weapon Damage: 8")
    print("2. Warrior - Life point: 20 pts - Weapon: Axe - Weapon Damage: 15")
    print("3. Knight - Life point: 25 pts - Weapon: Sword - Weapon Damage: 10")
    choice = input()
    // if choice is different of the charactere selection
    if choice != "1" && choice != "2" && choice != "3" {
        fighterNoExist()
    }
}

func fighterNoExist() {
    // Alert message when player select a wrong fighter
    print("this fighter do not exist !")
}

func actionFighter() {
    // Message that displays the possible actions to execute
    print("what do you want to do ?")
    print("1. Attack")
    print("2. Treat")
    choice = input()
    print()
    if choice != "1" && choice != "2" {
        // Alert message when player select a wrong action
        print("this action do not exist !")
    }
}

func selectFighter() {
    // Player 1 draft selection
    for i in 1...3 {
        print("Player 1: select your fighter number \(i)")
        repeat {
            // Print charactere selection
            fighterChoice()
        } while choice != "1" && choice != "2" && choice != "3"
        
        var draft1: Classe!
        switch choice {
        case "1":
            draft1 = .Archer
        case "2":
            draft1 = .Warriors
        case "3":
            draft1 = .Knight
        default:
            break
        }
        if choice == "1" {
            let character1 = Characters(name: "Fighter \(i)", classe: draft1)
            teamP1.append(character1)
        } else if choice == "2" {
            let character2 = Characters(name: "Fighter \(i)", classe: draft1)
            teamP1.append(character2)
        } else if choice == "3" {
            let character3 = Characters(name: "Fighter \(i)", classe: draft1)
            teamP1.append(character3)
        }
        // The empty print function adds space to the console text
        print()
    }
    lifeTeamP1 = teamP1[0].life + teamP1[1].life + teamP1[2].life
    // Player 2 Draft selection
    for i in 1...3 {
        print("Player 2: select your fighter number \(i)")
        repeat {
            fighterChoice()
        } while choice != "1" && choice != "2" && choice != "3"
        
        var draft2: Classe!
        switch choice {
        case "1":
            draft2 = .Archer
        case "2":
            draft2 = .Warriors
        case "3":
            draft2 = .Knight
        default:
            break
        }
        if choice == "1" {
            let character4 = Characters(name: "Fighter \(i + 3)", classe: draft2)
            teamP2.append(character4)
        } else if choice == "2" {
            let character5 = Characters(name: "Fighter \(i + 3)", classe: draft2)
            teamP2.append(character5)
        } else if choice == "3" {
            let character6 = Characters(name: "Fighter \(i + 3)", classe: draft2)
            teamP2.append(character6)
        }
        print()
    }
    lifeTeamP2 = teamP2[0].life + teamP2[1].life + teamP2[2].life
}

func startGame() {
    while lifeTeamP1 > 0 && lifeTeamP2 > 0 {
        var attacker: Characters!
        var defender: Characters!
        
        // Player 1 Lap
        repeat {
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
            if choice != "1" && choice != "2" && choice != "3" {
                print("this fighter do not exist !")
            }
        } while choice != "1" && choice != "2" && choice != "3";
        
        switch choice {
        case "1":
            attacker = teamP1[0]
        case "2":
            attacker = teamP1[1]
        case "3":
            attacker = teamP1[2]
        default:
            break
        }
        print()
        // Player 1 decides what to do
        repeat {
            actionFighter()
        } while choice != "1" && choice != "2"
        
        // If the player 1 decides to attack, he chooses a target of player 2 team's
        if choice == "1" {
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
                if choice != "1" && choice != "2" && choice != "3" {
                    fighterNoExist()
                }
            } while choice != "1" && choice != "2" && choice != "3"
            
            switch choice {
            case "1":
                defender = teamP2[0]
            case "2":
                defender = teamP2[1]
            case "3":
                defender = teamP2[2]
            default:
                break
            }
            print()
            if attacker.life <= 0 {
                // if attacker is K.O, he can't attack
                print("Attacker is KO, no Attack")
            } else {
                // else the fighter attack
                attacker.battle(versus: defender)
            }
        } else {
            // else the player 1 decides to treat
            attacker.treat(attacker: attacker)
        }
        print()
        
        // This condition not allows to play the player 2 if all his characters team are K.O
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
            } while choice != "1" && choice != "2" && choice != "3"
            
            switch choice {
            case "1":
                attacker = teamP2[0]
            case "2":
                attacker = teamP2[1]
            case "3":
                attacker = teamP2[2]
            default:
                break
            }
            print()
            repeat {
                actionFighter()
            }while choice != "1" && choice != "2"
            
            if choice == "1" {
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
                    if choice != "1" && choice != "2" && choice != "3" {
                        fighterNoExist()
                    }
                } while choice != "1" && choice != "2" && choice != "3"
                
                switch choice {
                case "1":
                    defender = teamP1[0]
                case "2":
                    defender = teamP1[1]
                case "3":
                    defender = teamP1[2]
                default:
                    break
                }
                if attacker.life <= 0 {
                    // if attacker is K.O, he can't attack
                    print("Attacker is KO, no Attack")
                } else {
                    // // else the fighter attack
                    attacker.battle(versus: defender)
                }
            } else {
                // else the player 1 decides to treat
                attacker.treat(attacker: attacker)
            }
            print()
        }
        // end of the laps
        // Update of life team characters
        lifeTeamP1 = teamP1[0].life + teamP1[1].life + teamP1[2].life
        lifeTeamP2 = teamP2[0].life + teamP2[1].life + teamP2[2].life
        if lifeTeamP1 > 0 && lifeTeamP1 > 0 {
            numberOfLaps += 1
        }
    }
}

func displayWinner(){
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
}
}
