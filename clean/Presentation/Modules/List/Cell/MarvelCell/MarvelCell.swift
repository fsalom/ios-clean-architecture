//
//  MarvelCell.swift
//  clean
//
//  Created by Fernando Salom Carratala on 26/4/23.
//

import UIKit

class MarvelCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marvelCharacterImage: UIImageView!

    var character: (CharacterProtocol & MarvelCharacterProtocol)! {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupUI() {
        marvelCharacterImage.layer.masksToBounds = false
        marvelCharacterImage.clipsToBounds = true
        marvelCharacterImage.backgroundColor = .white
        nameLabel.text = character.name
        if let urlString = character.image, let url = URL(string: urlString) {
            marvelCharacterImage.load(url: url)
        }
    }
}
