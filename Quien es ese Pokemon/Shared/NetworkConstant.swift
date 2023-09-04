//
//  NetworkConstant.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 03/09/23.
//

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()

    private init() {
        // Singleton
    }

    public var pokemonUrl: String {
        return "https://pokeapi.co/api/v2/pokemon?limit=898&offset=0"
    }
}
