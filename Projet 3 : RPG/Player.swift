//
//  Player.swift
//  Projet 3 : RPG
//
//  Created by Frederick Port on 25/08/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//

import Foundation

class Player {
    var playerName: String
    var teamPlayer: [Characters]
    var lifeTeamPlayer: Int
    var choice: String?
    
    init(playerName: String, teamPlayer: [Characters], lifeTeamPlayer: Int){
        self.teamPlayer = teamPlayer
        self.lifeTeamPlayer = lifeTeamPlayer
        self.playerName = playerName
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
        choice = gameParty.input()
        // if choice is different of the charactere selection
        if choice != "1" && choice != "2" && choice != "3" {
            fighterNoExist()
        }
    }
    
    func renameFighter() {
        print("Give a name to your fighter")
        choice = gameParty.input()
    }
    
    func fighterNoExist() {
        // Alert message when player select a wrong fighter
        print("this fighter do not exist !")
    }
    
    func draftSelection() {
        // Draft player selection
        for i in 1...3 {
            if gameParty.player1Lap == true {
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
            if gameParty.player1Lap == true {
                if choice == "1" {
                    renameFighter()
                    let character1 = Characters(name: "Fighter \(i)", fighterType: draft)
                    character1.name = choice!
                    teamPlayer.append(character1)
                    
                } else if choice == "2" {
                    renameFighter()
                    let character2 = Characters(name: "Fighter \(i)", fighterType: draft)
                    character2.name = choice!
                    teamPlayer.append(character2)
                    
                } else if choice == "3" {
                    renameFighter()
                    let character3 = Characters(name: "Fighter \(i)", fighterType: draft)
                    character3.name = choice!
                    teamPlayer.append(character3)
                }
                // The empty print function adds space to the console text
                print()
                
            } else {
                if choice == "1" {
                    renameFighter()
                    let character4 = Characters(name: "Fighter \(i + 3)", fighterType: draft)
                    character4.name = choice!
                    teamPlayer.append(character4)
                } else if choice == "2" {
                    renameFighter()
                    let character5 = Characters(name: "Fighter \(i + 3)", fighterType: draft)
                    character5.name = choice!
                    teamPlayer.append(character5)
                } else if choice == "3" {
                    renameFighter()
                    let character6 = Characters(name: "Fighter \(i + 3)", fighterType: draft)
                    character6.name = choice!
                    teamPlayer.append(character6)
                }
                print()
            }
        }
    }
}
