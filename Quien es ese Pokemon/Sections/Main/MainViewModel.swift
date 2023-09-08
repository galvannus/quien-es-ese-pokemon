//
//  MainViewModel.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 24/08/23.
//

import UIKit
import Combine

class MainViewModel {
    /*@Published var finalScore = 0
    @Published var pokemonName = ""
    @Published var pokemonImageUrl = ""*/
    @Published var gameOver = false
    
    //Propiedad para guardar las referencias de las propiedades
    var cancellables = Set<AnyCancellable>()
    
    let apiCaller: ApiCaller
    
    init(apiCaller: ApiCaller){
        self.apiCaller = apiCaller
        
        suscriptions()
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
    
    func suscriptions(){
        $gameOver.sink{value in
            print("GameOver")
        }.store(in: &cancellables)
    }
}
