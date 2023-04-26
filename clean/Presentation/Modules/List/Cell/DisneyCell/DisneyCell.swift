//
//  DisneyCell.swift
//  clean
//
//  Created by Fernando Salom Carratala on 25/4/23.
//

import UIKit

class DisneyCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var character: (CharacterProtocol & DisneyCharacterProtocol)! {
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
    }
    // MARK: - Functions
    func setupUI() {
        nameLabel.text = character.name
        profileImageView.layer.masksToBounds = false
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .white
        if let urlString = character.image, let url = URL(string: urlString) {
            profileImageView.load(url: url)
        }
    }
}
