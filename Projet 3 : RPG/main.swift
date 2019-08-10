//
//  main.swift
//  Projet 3 : RPG
//
//  Created by Frederick Port on 01/08/2019.
//  Copyright © 2019 French game factory. All rights reserved.
//
import Foundation
// initialization of the game, creation of the 2 teams and the variable numbersOfLaps
let gameParty = Game(choice: "", teamP1: [], teamP2: [], lifeTeamP1: 0, lifeTeamP2: 0, numberOfLaps: 1)
// We ask the players which characters they want to select in their team
gameParty.selectFighter()
// Battle Start, players play while one team is K.O
gameParty.startGame()
// End of the game, display winner
gameParty.displayWinner()
// Game over
