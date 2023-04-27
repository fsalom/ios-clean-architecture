//
//  HomeController.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import UIKit

final class ListViewController: BaseViewController {
    var viewModel: ListViewModelProtocol!

    // MARK: - IBOutlets
    @IBOutlet weak var sourceSegmented: UISegmentedControl! {
        didSet {
            sourceSegmented.removeAllSegments()
            for index in 0...viewModel.dataSources.count - 1  {
                sourceSegmented.insertSegment(withTitle: viewModel.dataSources[index], at: index, animated: true)
            }
        }
    }
    lazy var searchBar: UISearchBar = UISearchBar()
    @IBOutlet weak var tableView: UITableView!

    // MARK: - IBActions
    @IBAction func sourceSegmentedValueChanged(_ sender: UISegmentedControl) {
        viewModel.sourceChanged(to: sender.selectedSegmentIndex)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupSearch()
        configure()
        viewModel.viewDidLoad()
    }

    // MARK: - Functions
    func setupBinding() {
        viewModel.listCharactersUpdated = { 	
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.errorHasOcurred = { error in
            print(error)
        }
    }

    func setupSearch() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Buscar..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }

    func configure(){
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        self.tableView.register(UINib(nibName: "RickAndMortyCharacterCell", bundle: nil), forCellReuseIdentifier: "RickAndMortyCharacterCell")
        self.tableView.register(UINib(nibName: "DisneyCell", bundle: nil), forCellReuseIdentifier: "DisneyCell")
        self.tableView.register(UINib(nibName: "MarvelCell", bundle: nil), forCellReuseIdentifier: "MarvelCell")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.viewModel.loadMoreCharacter(currentItem: indexPath.row)
        let character = self.viewModel.characters[indexPath.row]
        if character is (CharacterProtocol & RickAndMortyCharacterProtocol) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RickAndMortyCharacterCell", for: indexPath) as! RickAndMortyCharacterCell
            cell.character = character as? (CharacterProtocol & RickAndMortyCharacterProtocol)
            return cell
        }
        if character is (CharacterProtocol & DisneyCharacterProtocol) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisneyCell", for: indexPath) as! DisneyCell
            cell.character = character as? (CharacterProtocol & DisneyCharacterProtocol)
            return cell
        }
        if character is (CharacterProtocol & MarvelCharacterProtocol) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCell", for: indexPath) as! MarvelCell
            cell.character = character as? (CharacterProtocol & MarvelCharacterProtocol)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.character = character
        return cell
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search(this: searchText)
    }
}
