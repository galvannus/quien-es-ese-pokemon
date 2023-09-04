//
//  MainView+Protocols.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 03/09/23.
//

import Foundation

// MARK: - Que es lo que debe de tener

protocol MainViewDelegate {
    // Se ejecutara cuando se actualice la lista de pokemons
    func didUpdatePokemon(pokemons: [PokemonModel])
    // Se ejecutara cuando se actualice la lista de pokemons
    func didUpdateImagePokemon(image: PokemonImageModel)
    // Se ejecutara cuando haya un error
    func didFailWithError(error: Error)
}
