//
//  MainViewModel.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 24/08/23.
//

import UIKit

class MainViewModel {
    let apiCaller: ApiCaller
    
    init(apiCaller: ApiCaller){
        self.apiCaller = apiCaller
    }

    func getPokemonImage() -> UIImage {
        return UIImage(named: "pikachu")!
    }

    func getTitleButton() -> String {
        return "Pokemon"
    }

    func fetchPokemon() {
        apiCaller.performRequest(with: NetworkConstant.shared.pokemonUrl)
    }
    
    func fetchImage(url: String){
        apiCaller.performRequestImage(with: url)
    }
    
}
