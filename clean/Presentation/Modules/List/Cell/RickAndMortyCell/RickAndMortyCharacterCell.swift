//
//  RickAndMortyCell.swift
//  clean
//
//  Created by Fernando Salom Carratala on 24/4/23.
//

import UIKit

class RickAndMortyCharacterCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var characterImage: UIImageView!

    var character: (CharacterProtocol & RickAndMortyCharacterProtocol)! {
        didSet {
            setupUI()
        }
    }
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func prepareForReuse() {
        characterImage.image = nil
    }
    // MARK: - Functions
    func setupUI() {
        characterName.text = character.name
        characterImage.layer.masksToBounds = false
        characterImage.layer.cornerRadius = 10
        characterImage.clipsToBounds = true
        characterImage.backgroundColor = .white
        statusView.layer.cornerRadius = 10

        if let urlString = character.image, let url = URL(string: urlString) {
            characterImage.load(url: url)
        }

        switch character.status {
        case "Alive":
            statusView.backgroundColor = .green
        case "Dead":
            statusView.backgroundColor = .red
        default:
            statusView.backgroundColor = .gray
        }
    }
}
