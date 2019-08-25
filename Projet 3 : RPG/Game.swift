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
    var gameChoice: String?
    var numberOfLaps: Int
    var player1Lap: Bool
    var player2Lap: Bool

    init(numberOfLaps: Int, player1Lap: Bool, player2Lap: Bool){
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
    
    func actionFighter() {
        // Message that displays the possible actions to execute
        print("what do you want to do ?")
        print("1. Attack")
        print("2. Treat")
        gameChoice = input()
        print()
        if gameChoice != "1" && gameChoice != "2" {
            // Alert message when player select a wrong action
            print("this action do not exist !")
        }
    }
    
    func changePlayerLap(){
    // Function who reverse player lap round
        player1Lap = !player1Lap
        player2Lap = !player2Lap
    }
    
    func lapGame() {
        var attacker: Characters!
        var defender: Characters!
        var attackerLap: [Characters]
        var defenderLap: [Characters]
        //var choice : String?
        
        func magicChest() {
            // Generation of a random number between 0 and 9
            let number = Int(arc4random_uniform(9))
            // If the generated number is less than or equal to 2, appearance of the magic chest
            if number <= 2 {
                // Random selection of the new weapon
                let weaponNumber = Int(arc4random_uniform(2)+1)
                if weaponNumber == 1 {
                    attacker.weapon = Weapon(weaponName: "Tongfar", weaponDamage: 12)
                } else if weaponNumber == 2 {
                    attacker.weapon = Weapon(weaponName: "Triple Rod", weaponDamage: 15)
                } else if weaponNumber == 3 {
                    attacker.weapon = Weapon(weaponName: "Sceptre", weaponDamage: 10)
                }
                print("Appearance of a magic chest")
                print("New weapon get: \(attacker.weapon.weaponName)")
                print()
            }
        }
        
        repeat {
            if player1Lap == true {
                attackerLap = player1.teamPlayer
                defenderLap = player2.teamPlayer
            } else {
                attackerLap = player2.teamPlayer
                defenderLap = player1.teamPlayer
            }
            print("Laps  \(numberOfLaps)")
            // Player 1 select a fighter
            if player1Lap == true {
                print("Player 1: Choose your attacker")
                print("Total Team life : \(player1.lifeTeamPlayer)")
            } else {
                print("Player 2: Choose your attacker")
                print("Total Team life : \(player2.lifeTeamPlayer)")
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
            
            gameChoice = input()
            if gameChoice != "1" && gameChoice != "2" && gameChoice != "3" {
                if player1Lap == true {
                    player1.fighterNoExist()
                } else {
                    player2.fighterNoExist()
                }
            }
            
        } while gameChoice != "1" && gameChoice != "2" && gameChoice != "3";
        
        switch gameChoice {
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
            if player1Lap == true {
                actionFighter()
            }
            else {
                actionFighter()
            }
        } while gameChoice != "1" && gameChoice != "2"
        // If the player decides to attack, he chooses a target of the opponent team
        if gameChoice == "1" {
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
                gameChoice = gameParty.input()
                if gameChoice != "1" && gameChoice != "2" && gameChoice != "3" {
                    if player1Lap == true {
                        player1.fighterNoExist()
                    } else {
                        player2.fighterNoExist()
                    }
                }
            } while gameChoice != "1" && gameChoice != "2" && gameChoice != "3"
            
            switch gameChoice {
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
                magicChest()
                attacker.battle(versus: defender)
            }
            
        } else {
            // else the player 1 decides to treat
            attacker.treat(attacker: attacker)
        }
        player1.updateLifeTeam()
        player2.updateLifeTeam()
        changePlayerLap()
        print()
    }
    
    func selectFighter() {
        // Player 1 Draft Selection
        player1.draftSelection()
        changePlayerLap()
        // Player 2 Draft Selection
        player2.draftSelection()
        changePlayerLap()
        // Update team Life
        player1.updateLifeTeam()
        player2.updateLifeTeam()
    }
    
    func startGame() {
        while player1.lifeTeamPlayer > 0 && player2.lifeTeamPlayer > 0 {
            lapGame()
            // This condition not allows to play the player 2 if all his characters team are K.O
            if player2.lifeTeamPlayer > 0 {
                lapGame()
            }
            // end of the laps, update of life team characters
            player1.updateLifeTeam()
            player2.updateLifeTeam()
            
            if player1.lifeTeamPlayer > 0 && player2.lifeTeamPlayer > 0 {
                numberOfLaps += 1
            }
        }
    }
    
    func displayWinner(){
        // The winner is
        let winner: String
        if player1.lifeTeamPlayer > 0 {
            winner = player1.playerName
            
        } else {
            winner = player2.playerName
        }
        // Winner is printing
        print("the Winner is " + winner + " !")
        print("Number of laps : \(numberOfLaps)")
        print()
        for fighter in player1.teamPlayer {
            print(fighter.desc())
            
        }
        for fighter in player2.teamPlayer {
            print(fighter.desc())
            
        }
        // End of the game
        print("Game Over")
    }
}
