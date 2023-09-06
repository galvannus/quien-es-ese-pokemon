//
//  GameModel.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 04/09/23.
//

import Foundation

struct GameModel {
    var score = 0

    // Revisar respuesta correcta
    mutating func checkAnswer(_ userAnswer: String, _ correcAnswer: String) -> Bool {
        if userAnswer.lowercased() == correcAnswer.lowercased() {
            score += 1
            return true
        }
        return false
    }

    // Obtener respuesta
    func getScore() -> Int {
        return score
    }

    // Reiniciar Score
    mutating func setScore(score: Int) {
        self.score = score
    }
}
