//
//  PokemonImageData.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 03/09/23.
//

import Foundation

// MARK: - PokemonData

struct PokemonImageData: Codable {
    let sprites: Sprites?
}

// MARK: - Sprites

class Sprites: Codable {
    let other: Other?

    init(other: Other?) {
        self.other = other
    }
}

// MARK: - Other

struct Other: Codable {
    let officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork

struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
