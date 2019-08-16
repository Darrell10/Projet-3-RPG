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
var player1Lap: Bool
var player2Lap: Bool

    init(choice: String?, teamP1: [Characters], teamP2: [Characters], lifeTeamP1: Int, lifeTeamP2: Int, numberOfLaps: Int, player1Lap: Bool, player2Lap: Bool){
        self.choice = choice
        self.teamP1 = teamP1
        self.teamP2 = teamP2
        self.lifeTeamP1 = lifeTeamP1
        self.lifeTeamP2 = lifeTeamP2
        self.numberOfLaps = numberOfLaps
        self.player1Lap = player1Lap
        self.player2Lap = player2Lap
    }

// Methods
    func input() -> String {
    // Function that will be used to determine the players' choices
    let strData = readLine()
    return String(strData!)
    }
    
    func changePlayerLap(){
    // Function who reverse player lap round
        player1Lap = !player1Lap
        player2Lap = !player2Lap
    }
    
    func updateLifeTeam() {
    // Update player's team life
        lifeTeamP1 = teamP1[0].life + teamP1[1].life + teamP1[2].life
        lifeTeamP2 = teamP2[0].life + teamP2[1].life + teamP2[2].life
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
    
    func draftSelection() {
    // Draft player selection
        for i in 1...3 {
            if player1Lap == true {
                print("Player 1: select your fighter number \(i)")
            }
            else {
                print("Player 2: select your fighter number \(i + 3)")
            }
            repeat {
                // Print charactere selection
                fighterChoice()
            } while choice != "1" && choice != "2" && choice != "3"
            
            var draft: FighterType!
            switch choice {
            case "1":
                draft = .Archer
            case "2":
                draft = .Warriors
            case "3":
                draft = .Knight
            default:
                break
            }
            if player1Lap == true {
                if choice == "1" {
                    let character1 = Characters(name: "Fighter \(i)", fighterType: draft)
                    teamP1.append(character1)
                    
                } else if choice == "2" {
                    let character2 = Characters(name: "Fighter \(i)", fighterType: draft)
                    teamP1.append(character2)
                    
                } else if choice == "3" {
                    let character3 = Characters(name: "Fighter \(i)", fighterType: draft)
                    teamP1.append(character3)
                    
                }
                // The empty print function adds space to the console text
                print()
                
            } else {
                if choice == "1" {
                    let character4 = Characters(name: "Fighter \(i + 3)", fighterType: draft)
                    teamP2.append(character4)
                } else if choice == "2" {
                    let character5 = Characters(name: "Fighter \(i + 3)", fighterType: draft)
                    teamP2.append(character5)
                } else if choice == "3" {
                    let character6 = Characters(name: "Fighter \(i + 3)", fighterType: draft)
                    teamP2.append(character6)
                }
                print()
            }
        }
        changePlayerLap()
    }
    
    func lapGame() {
        var attacker: Characters!
        var defender: Characters!
        var attackerLap: [Characters]
        var defenderLap: [Characters]
        
        repeat {
            if player1Lap == true {
                attackerLap = teamP1
                defenderLap = teamP2
            } else {
                attackerLap = teamP2
                defenderLap = teamP1
            }
            print("Laps  \(numberOfLaps)")
            // Player 1 select a fighter
            if player1Lap == true {
                print("Player 1: Choose your attacker")
                print("Total Team life : \(lifeTeamP1)")
            } else {
                print("Player 2: Choose your attacker")
                print("Total Team life : \(lifeTeamP2)")
            }
            
            if attackerLap[0].life <= 0 {
                print("1.KO")
                attackerLap[0].weapon.weaponDamage = 0
            } else {
                print("1.\(attackerLap[0].name)" + " - life : \(attackerLap[0].life)" + " - Weapon : \(attackerLap[0].weapon.weaponName)")
            }
            
            if attackerLap[1].life <= 0 {
                print("2.KO")
                attackerLap[1].weapon.weaponDamage = 0
            } else {
                print("2.\(attackerLap[1].name)" + " - life : \(attackerLap[1].life)" + " - Weapon : \(attackerLap[1].weapon.weaponName)")
            }
            
            if attackerLap[2].life <= 0 {
                print("3.KO")
                attackerLap[2].weapon.weaponDamage = 0
            } else {
                print("3.\(attackerLap[2].name)" + " - life : \(attackerLap[2].life)" + " - Weapon : \(attackerLap[2].weapon.weaponName)")
            }
            
            choice = input()
            if choice != "1" && choice != "2" && choice != "3" {
                fighterNoExist()
            }
            
        } while choice != "1" && choice != "2" && choice != "3";
        
        switch choice {
        case "1":
            attacker = attackerLap[0]
        case "2":
            attacker = attackerLap[1]
        case "3":
            attacker = attackerLap[2]
        default:
            break
        }
        
        print()
        // Player decides what to do
        repeat {
            actionFighter()
        } while choice != "1" && choice != "2"
        
        // If the player decides to attack, he chooses a target of the opponent team
        if choice == "1" {
            repeat {
                if player1Lap == true {
                    print("Player 1: Choose the defender !")
                }
                else {
                    print("Player 2: Choose the defender !")
                }
                
                if defenderLap[0].life <= 0 {
                    print("1.KO")
                } else {
                    print("1.\(defenderLap[0].name)" + " - life : \(defenderLap[0].life)")
                }
                
                if defenderLap[1].life <= 0 {
                    print("2.KO")
                } else {
                    print("2.\(defenderLap[1].name)" + " - life : \(defenderLap[1].life)")
                }
                
                if defenderLap[2].life <= 0 {
                    print("3.KO")
                } else {
                    print("3.\(defenderLap[2].name)" + " - life : \(defenderLap[2].life)")
                }
                
                // print("Total Team life : \(lifeTeamP2)")
                choice = input()
                if choice != "1" && choice != "2" && choice != "3" {
                    fighterNoExist()
                }
            } while choice != "1" && choice != "2" && choice != "3"
            
            switch choice {
            case "1":
                defender = defenderLap[0]
            case "2":
                defender = defenderLap[1]
            case "3":
                defender = defenderLap[2]
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
        
        updateLifeTeam()
        changePlayerLap()
        print()
        
    }
    
    func selectFighter() {
        // Player 1 Draft Selection
        draftSelection()
        // Player 2 Draft Selection
        draftSelection()
        // Update team Life
        updateLifeTeam()
    }
    
    func startGame() {
        while lifeTeamP1 > 0 && lifeTeamP2 > 0 {
            lapGame()
            // This condition not allows to play the player 2 if all his characters team are K.O
            if lifeTeamP2 > 0 {
                lapGame()
            }
            // end of the laps, update of life team characters
            updateLifeTeam()
            
            if lifeTeamP1 > 0 && lifeTeamP2 > 0 {
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
