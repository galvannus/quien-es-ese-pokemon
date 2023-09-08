//
//  GameOverController.swift
//  Quien es ese Pokemon
//
//  Created by Jorge Alejndro Marcial Galvan on 06/09/23.
//

import UIKit
import Kingfisher

class GameOverController: UIViewController {
    
    public static var identifier: String{
        get{
            return "GameOverController"
        }
    }
    
    public static func register() -> UINib{
        UINib(nibName: "GameOverController", bundle: nil)
    }
    
    private var pokemonImage: UIImageView!
    private var titleLabel: UILabel!
    private var scoreLabel: UILabel!
    private var messageLabel: UILabel!
    private var playAgainButton: UIButton!

    var pokemonName: String = ""
    var pokemonImageUrl: String = ""
    var finalScore = 0

    // MARK: - Properties

    weak var coordinator: Coordinator?
    weak var context: Context?
    var viewModel: GameOverModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        setUpView()
        setUpLayout()
    }

    private func setUpView() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "¡OOOPS! Perdiste"
        titleLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center

        pokemonImage = UIImageView()
        pokemonImage.kf.setImage(with: URL(string: pokemonImageUrl))
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        pokemonImage.contentMode = .scaleAspectFit

        messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "No, es un \(pokemonName)"
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center

        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Perdiste, tu puntaje fue de \(finalScore)"
        scoreLabel.numberOfLines = 0
        scoreLabel.textAlignment = .center

        playAgainButton = UIButton()
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        playAgainButton.setTitle("Jugar de nuevo", for: .normal)
        playAgainButton.setTitleColor(.white, for: .normal)
        playAgainButton.backgroundColor = .systemBlue
        playAgainButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
    }

    private func setUpLayout() {
        view.addSubview(titleLabel)
        view.addSubview(pokemonImage)
        view.addSubview(messageLabel)
        view.addSubview(scoreLabel)
        view.addSubview(playAgainButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            pokemonImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 120),
            pokemonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            pokemonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            messageLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 15),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            scoreLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 120),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            playAgainButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 80),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }

    @objc func playAgain() {
        //context?.initialize(coordinator: MainViewCoordinator(context: context!))
        dismiss(animated: true)
    }
}
