//
//  ApiCaller.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 03/09/23.
//

import Foundation

public class ApiCaller{
    var delegate: MainViewDelegate?
    
    //MARK: - PokemonData
    
    public func performRequest(with urlString: String) {
        // 1. Create/get URL
        if let url = URL(string: urlString) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { [self] data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                }

                if let safeData = data {
                    if let pokemon = self.parseJSON(pokemonData: safeData) {
                        delegate?.didUpdatePokemon(pokemons: pokemon)
                        //print(pokemon)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }

    private func parseJSON(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PokemonData.self, from: pokemonData)
            let pokemon = decodeData.results?.compactMap({
                if let name = $0.name, let imageURL = $0.url {
                    return PokemonModel(name: name, imageURL: imageURL)
                }
                return nil
            })
            return pokemon
        } catch {
            return nil
        }
    }
    
    //MARK: - PokemonImageModel
    
    public func performRequestImage(with urlString: String) {
        // 1. Create/get URL
        if let url = URL(string: urlString) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { [self] data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                }

                if let safeData = data {
                    if let image = self.parseJSONimage(imageData: safeData) {
                        delegate?.didUpdateImagePokemon(image: image)
                        //print(pokemon)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }

    private func parseJSONimage(imageData: Data) -> PokemonImageModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PokemonImageData.self, from: imageData)
            let pokemonImage = decodeData.sprites?.other?.officialArtwork?.frontDefault ?? ""
            
            return PokemonImageModel(imageUrl: pokemonImage)
        } catch {
            return nil
        }
    }
}
