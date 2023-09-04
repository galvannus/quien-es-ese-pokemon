//
//  MainViewController.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 23/08/23.
//

import UIKit

class MainViewController: UIViewController {
    private var stackView: UIStackView!
    private var pokemonImage: UIImageView!
    private var titleLabel: UILabel!
    private var scoreLabel: UILabel!
    private var pokemonNameLabel: UILabel!

    var randomPokemons: [PokemonModel] = []
    var correctAnswer: String = ""
    var correctAnswerImage: String = ""

    // MARK: - Properties

    weak var coordinator: Coordinator?
    weak var context: Context?
    var viewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        viewModel.apiCaller.delegate = self

        setUpView()
        setUpLayout()
        viewModel.fetchPokemon()
    }

    private func setUpView() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "¿Quién es ese Pokémon?"
        titleLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center

        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: 0"
        scoreLabel.numberOfLines = 0
        scoreLabel.textAlignment = .center

        pokemonImage = UIImageView(image: viewModel.getPokemonImage())
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.contentMode = .scaleAspectFit

        pokemonNameLabel = UILabel()
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNameLabel.text = "Si, es un Pikachu"
        pokemonNameLabel.numberOfLines = 0
        pokemonNameLabel.textAlignment = .center

        /*
         nameOption2Button = UIButton(type: .system)
         nameOption2Button.translatesAutoresizingMaskIntoConstraints = false
         nameOption2Button.setTitle(viewModel.getTitleButton(), for: .normal)
         nameOption2Button.setTitleColor(.black, for: .normal)
         nameOption2Button.backgroundColor = .white
         nameOption2Button.addTarget(self, action: #selector(option2Pressed), for: .touchUpInside)
          */

        // stackView = UIStackView(arrangedSubviews: [nameOption1Button, nameOption2Button, nameOption3Button, nameOption4Button])
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 24

        // UIButtons
        ["Pokemon 1", "Pokemon 2", "Pokemon 3", "Pokemon 4"].forEach { pokemonName in
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(pokemonName, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
            // Altura
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            // Sombra del button - offset Cuanto se va a mover la sombra de la posición inicial del button
            button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            // Opacidad de la sombra
            button.layer.shadowOpacity = 1.0
            // Radio de la somra
            button.layer.shadowRadius = 0
            // Para que se visualicen los efectos correctamente
            button.layer.masksToBounds = false
            // Radio de las esquinas del button
            button.layer.cornerRadius = 10.0
            button.addTarget(self, action: #selector(optionPressed), for: .touchUpInside)

            stackView.addArrangedSubview(button)
        }
    }

    private func setUpLayout() {
        view.addSubview(titleLabel)
        view.addSubview(scoreLabel)
        view.addSubview(pokemonImage)
        view.addSubview(pokemonNameLabel)
        view.addSubview(stackView)

        /*
         [nameOption1Button, nameOption2Button, nameOption3Button, nameOption4Button].forEach {
             $0?.heightAnchor.constraint(equalToConstant: 50).isActive = true
         }
          */

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            scoreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            pokemonImage.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 50),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 2),
            pokemonNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stackView.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Width anchor 20 left x 20 right
            stackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
        ])
    }

    @objc func optionPressed(sender: UIButton!) {
        if let title = sender.title(for: .normal) {
            print(title)
        }
    }
}
