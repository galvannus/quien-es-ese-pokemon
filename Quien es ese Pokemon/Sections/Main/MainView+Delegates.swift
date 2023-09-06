//
//  MainView+Delegates.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 03/09/23.
//

import UIKit

// MARK: - Custom Delegates

extension MainViewController: MainViewDelegate {
    // MARK: - PokemonData

    func didUpdatePokemon(pokemons: [PokemonModel]) {
        randomPokemons = pokemons.choose(4)
        //print(randomPokemons)

        // Get random number
        let index = Int.random(in: 0 ... 3)
        // Save the correct image
        let imageData = randomPokemons[index].imageURL
        // Save correct answer
        correctAnswer = randomPokemons[index].name

        viewModel.fetchImage(url: imageData)
        // imageManager.fetchImage(url: imageData)
    }

    // MARK: - PokemonImageModel

    func didUpdateImagePokemon(image: PokemonImageModel) {
        correctAnswerImage = image.imageUrl
    }

    func didFailWithError(error: Error) {
        print(error)
    }
}

// Al seleccionar un elemento del array no se salga de los limites
extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex) ? self[index] : nil
    }
}

// Elegir 4 aleatorios
extension Collection {
    func choose(_ n: Int) -> Array<Element> {
        Array(shuffled().prefix(n))
    }
}
