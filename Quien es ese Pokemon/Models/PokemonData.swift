//
//  PokemonData.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 01/09/23.
//

import UIKit

// MARK: - PokemonData

struct PokemonData: Codable {
    let results: [Result]?
}

struct Result: Codable {
    let name: String?
    let url: String?
}
