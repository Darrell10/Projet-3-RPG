//
//  Player.swift
//  Projet 3 : RPG
//
//  Created by Frederick Port on 25/08/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation

class Player {
    var teamPlayer: [Characters]
    var lifeTeamPlayer: Int
    
    init(teamPlayer: [Characters], lifeTeamPlayer: Int){
        self.teamPlayer = teamPlayer
        self.lifeTeamPlayer = lifeTeamPlayer
    }
    
    func updateLifeTeam() {
        // Update player's team life
        lifeTeamPlayer = teamPlayer[0].life + teamPlayer[1].life + teamPlayer[2].life
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
    
    func draftSelection() {
        // Draft player selection
        for i in 1...3 {
            if Game.player1Lap == true {
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
                    teamPlayer.append(character1)
                    
                } else if choice == "2" {
                    let character2 = Characters(name: "Fighter \(i)", fighterType: draft)
                    teamPlayer.append(character2)
                    
                } else if choice == "3" {
                    let character3 = Characters(name: "Fighter \(i)", fighterType: draft)
                    teamPlayer.append(character3)
                    
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
}
